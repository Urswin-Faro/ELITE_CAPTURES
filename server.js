// server.js
const express = require('express');
const path = require('path');
require('dotenv').config(); // Load environment variables from .env file

// Import your API routes
const apiRoutes = require('./routes/api');

// Import your database connection module
// This line will also trigger the console.log from config/db.js when the server starts
const db = require('./config/db');

const app = express();
const PORT = process.env.PORT || 3000; // Use port from .env or default to 3000

// Middleware to parse JSON request bodies
// This is essential for POST requests where data is sent as JSON (like adding a user)
app.use(express.json());

// Serve static files from the 'Public' directory
// This tells Express to make everything inside 'Public' accessible directly via the browser.
// For example, Public/HTML/Wedding.html becomes /HTML/Wedding.html
// Public/CSS/wedding.css becomes /CSS/wedding.css
app.use(express.static(path.join(__dirname, 'Public')));

// Mount your API routes
// All routes defined in routes/api.js will be prefixed with /api
// For example, router.get('/photos/wedding') in api.js becomes GET /api/photos/wedding
app.use('/api', apiRoutes);

// Define a route for the root URL '/' to serve your main index.html file
app.get('/', (req, res) => {
    // __dirname is the current directory (ELITE_CAPTURES)
    // path.join correctly constructs the path across different OS
    res.sendFile(path.join(__dirname, 'Public', 'HTML', 'index.html'));
});

// Define a direct route for the Wedding.html page
// This allows you to access it directly via /wedding
app.get('/wedding', (req, res) => {
    res.sendFile(path.join(__dirname, 'Public', 'HTML', 'Wedding.html'));
});

// Global error handling middleware (optional but recommended for catching unhandled errors)
app.use((err, req, res, next) => {
    console.error(err.stack); // Log the error stack to the console
    res.status(500).send('Something broke on the server!'); // Send a generic error response to the client
});

// Start the server
app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
    console.log('Ensure your MySQL server is running and database is correctly configured with tables and data!');
});