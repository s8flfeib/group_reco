const express = require("express");
const app = express();
const { pool } = require("./dbConfig");
const bcrypt = require('bcrypt');
const session = require("express-session");
const flash = require("express-flash");
const passport = require("passport");
require("dotenv").config();
//python
const { spawn } = require('child_process');
//
//python aktuell 
const {PythonShell} = require('python-shell');
//
app.use(express.static('public'))
app.use('/css', express.static(__dirname + 'public/css'))
app.use('/img', express.static(__dirname + 'public/img'))

const initializePassport = require("./passportConfig");
const { type } = require("os");
const { exit } = require("process");
const { each } = require("jquery");
 initializePassport(passport);

const PORT = process.env.PORT || 4000;

app.set('view engine', 'ejs');
app.use(express.urlencoded({ extended: false }));


app.use(
  session({
  secret: "secret",

  resave: false,

  saveUninitialized: false,

})
);

app.use(passport.initialize());
app.use(passport.session());



app.use(flash());


app.get('/', (req,res)=>{
    res.render('index')
});


app.get('/users/register', checkAuthenticated ,(req,res) =>{
    res.render("register");
});

app.get('/users/login',checkAuthenticated ,(req,res) =>{
    res.render("login");
});

app.get("/users/gradingsuccess", (req, res) => {
 
  let options = {
    mode: 'text',
    pythonPath: 'python',
    pythonOptions: ['-u'], // get print results in real-time
    args: [JSON.stringify(req.query), JSON.stringify(req.user)]
  };

  PythonShell.run('python/initial_grading.py', options, function (err, results) {
    if (err) throw err;
      console.log(results) 
      console.log('finished');
      res.redirect("/users/dashboard")
  });
});


app.get("/users/dashboard", checkNotAuthenticated, (req, res) => {
    // console.log(req.isAuthenticated());
  console.log(req.user)
  if (req.user.initiallogin == false)
    res.render("dashboard", { user: req.user.name, email: req.user.email});   //vorher user: req.user.email
  else
    res.redirect("/users/initial_login")
});

app.get("/users/logout", (req, res) => {
  req.logout();
  res.redirect('/');  
  //res.render('index', { message: "You have logged out successfully" });
});

app.get("/users/initial_login", async(req, res) => {

  let options = {
    mode: 'text',
    pythonPath: 'python',
    pythonOptions: ['-u'],
    args: [JSON.stringify(req.user)]
  }

  PythonShell.run('python/update_initial_login.py', options, function(err,results) {
    console.log(results)
    if (err) throw err;
    console.log("finished here")
    res.render("initial_login")
  })

});


app.get("/users/update_gradings",(req, res1) => {
  var restaurants = []
  const query = "SELECT name,restaurant_id FROM restaurants"
   pool.query(query,async (err, result) => {
      if(err){
        throw err
      }
      else{
       for(i in result.rows){
        var res = result.rows[i]
        const second_query = "SELECT stars FROM reviews WHERE restaurant_id = $1 and user_id = $2"
       stars = await pool.query(second_query,[res.restaurant_id, req.user.user_id])
                if(stars.rows.length != 0){
                               restaurants.push({name:res.name, grading:stars.rows[0].stars }) 
                }
                else {
                restaurants.push({name:res.name, grading: 0})
              }
              }
      }
      res1.render("update_gradings", { user_id: req.user.user_id, restaurants:restaurants})
    })  
  
})


app.get('/users/singleGrading', async(req,res) =>{

  let options = {
    mode: 'text',
    pythonPath: 'python',
    pythonOptions: ['-u'],
    args: [JSON.stringify(req.query), JSON.stringify(req.user)]
  }

  PythonShell.run('python/update_gradings.py', options, function(err,results) {
    if (err) throw err;
    console.log(results)
    console.log("finished here")
    res.redirect("/users/update_gradings")
  })

});

app.get('/users/group_recommendation', async(req,res) =>{
  console.log(req.query)
  let errors = [];
  for (x in req.query){
    let exists = await (pool.query("SELECT EXISTS(SELECT * FROM users WHERE email = $1)",
      [req.query[x]]))

    if(!(exists.rows[0].exists)){
      errors.push({message:req.query[x] + " is not registered!"})
      res.render("dashboard", {user: req.user.name, email: req.user.email, errors})
      return
    }
  }
  let options = {
    mode: 'text',
    pythonPath: 'python',
    pythonOptions: ['-u'], // get print results in real-time
    args: [JSON.stringify(req.query)]
  };

  PythonShell.run('python/main.py', options, function (err, results) {
    if (err) throw err;
    console.log(results)
    //position ändert sich je nach print oder?
    let list = JSON.parse(results.slice(-1)[0])

    name1 = list[0].restaurant_name
    link1 = list[0].link
    description1 = list[0].description
    link2 = list[1].link
    description2 = list[1].description
    name2 = list[1].restaurant_name
    console.log(name1)
    console.log(link1)

    console.log(link1)
    res.render("group_recommendation", {first_restaurant :name1, second_restaurant :name2, first_link: link1, second_link: link2, first_decp: description1, second_decp: description2})
    console.log('finished');
  });
});


app.post('/users/register',async (req,res) =>{
  let { name, email, password ,password2 } = req.body;
  let errors= [];
  console.log({name,email,password,password2});

  if(!name || !email || !password || !password2){
      errors.push({ message: "Please Enter all fields!"});
  }
  if(password.length < 6){
    errors.push({ message: "Password must have at least 8 characters!"});
  }
  if(password != password2){
    errors.push({ message: "Passwords do not match!"});
  }
  if (errors.length > 0){
      res.render("register", {errors});
  } else { 
    //Doppelt warum?
    if (errors.length > 0){
      console.log("test error")
      res.render("register", {errors});
    } else {
      console.log("TEST no error")
      hashedPassword = await bcrypt.hash(password, 10);
      console.log(hashedPassword);
      // Validation passed
      pool.query(
      `SELECT * FROM users
      WHERE email = $1`,
      [email],
      (err, results) => {
      if (err) {
        console.log(err);
      }
        console.log("results: ");
        console.log(results.rows);
        console.log(results.rows.length);

        if (results.rows.length > 0) {
          errors.push({ message: "Email already registered!"});
         // console.log("email allready registered")
          res.render("register", { errors });
        } else {
          pool.query(
          `INSERT INTO users (name, email, password)
          VALUES ($1, $2, $3)
          RETURNING user_id, password`,
          [name, email, hashedPassword],
          (err, results) => {
          if (err) {
            throw err;
          }
          
            console.log(results.rows);
            req.flash("success_msg", "You are now registered. Please log in!");
            res.redirect("/users/login")
          }
          );
        }
    })}
  }
});


app.post("/users/login",
  passport.authenticate("local", {
    successRedirect: "/users/dashboard",
    failureRedirect: "/users/login",
    failureFlash: true
  })
);


function checkAuthenticated(req, res, next) {
  if (req.isAuthenticated()) {
    return res.redirect("/users/dashboard");
  }
  next();
}

function checkNotAuthenticated(req, res, next) {
  if (req.isAuthenticated()) {
    return next();
  }
  res.redirect("/users/login");
}

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

