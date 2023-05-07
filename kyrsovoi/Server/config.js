const mysql = require('mysql2');

const connectionPool = mysql.createPool({
    connectionLimit: 10,
    host: '172.20.10.2',
    user: 'root',
    password: 'Sasha1',
    database: 'bd',
})

module.exports = connectionPool;

//192.168.0.118;192.168.1.66