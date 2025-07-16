// config/db.js
const mysql = require('mysql2/promise'); // <--- THIS LINE IS CRUCIAL AND WAS LIKELY MISSING OR TYPED INCORRECTLY

const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
});

async function testDbConnection() {
    try {
        const connection = await pool.getConnection();
        console.log('Successfully connected to MySQL database from db.js!');
        connection.release(); // Release the connection back to the pool
    } catch (error) {
        console.error('Error connecting to MySQL database from db.js:', error.message);
        // Exit process or handle error appropriately if DB connection is critical
        process.exit(1);
    }
}

// Call testDbConnection when the module is loaded
testDbConnection();

module.exports = pool; // Export the pool for use in other files