  const { Client } = require('pg');
         const client = new Client({
             user:"flo",
             password:"password",
             port:5732,
             host:"localhost",
             database:"db_testdocker"
         })    
    client.connect();
       
var restaurant_name = "Burger Mafia"
// document.getElementById("ausgabe").textContent = restaurant
const user_id = 1          

console.log('js db connect success')
var first_query = `SELECT restaurant_id From restaurants WHERE name = $1`;
client.query(first_query,[restaurant_name],(err, restaurant_id) => {
    // var restaurant_id1 = restaurant_id.rows[0].restaurant_id;
    console.log(restaurant_id)
        if (err) {
            console.log(err);
        } else{
            console.log("Line 23")
            var query =`SELECT stars FROM reviews where restaurant_id =$1 and user_id =$2`;
            client.query(query,[restaurant_id.rows[0].restaurant_id,user_id], (err, stars) => {
            if (err) {
                throw err;
            }else{  
                console.log(stars.rows[0].stars);
               // document.getElementById('ausgabe').textContent = stars.rows[0].stars
            }       
            client.end();
       })
    }
})
