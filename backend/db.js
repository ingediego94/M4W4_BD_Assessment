const mysql = require('mysql2');    // Import mysql2 package

const db = mysql.createConnection({     // Create a connection with mysql, especifically to "pd_diego_vallejo_hopper"
    host:'localhost',
    user:'root',
    password:'KiraAmarilla33%',
    database:'pd_diego_vallejo_hopper'
});

db.connect(err =>{
    if(err){
    console.error("Error to connect MYSQL", err);
    return;
    }
    console.log("Connected to MySQL database");
});

module.exports = db;