   const restaurant_name = "Burger Mafia"
    user_id = 1          
    const { Client } = require('pg');
    const client = new Client({
        user:"flo",
        password:"password",
        port:5732,
        host:"localhost",
        database:"db_testdocker"
    })    


        client.connect();
        console.log('js db connect success')
        const first_query = "SELECT restaurant_id FROM restaurants WHERE name =$1";
        console.log("Line 16") 

        client.query(first_query,[restaurant_name], (err,restaurant_id) => 
        { 
            console.log("Line 20")
            if(err){
                console,log(err);
            }
            else{
                console.log("LINE 25")
                const query =`SELECT stars FROM reviews where restaurant_id = $1 and user_id = $2`;
                client.query(query,[restaurant_id, user_id] , (err ,stars) => {
                    if(err){
                        throw err;
                    }
                    else
                    {console.log(stars);}
                }
                )
            }
        })

      