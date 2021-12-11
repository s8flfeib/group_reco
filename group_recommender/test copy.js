const { pool } = require("./dbConfig");
// require("dotenv").config();

console.log("Start Test")

pool.query("SELECT email FROM users WHERE user_id=1", (err,res) => {
    console.log(err, res)
    pool.end()
})

console.log("Finish Testing")