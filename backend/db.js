const mysql = require('mysql2');

const db = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'Qwe.123*',
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