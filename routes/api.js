// routes/api.js
const express = require('express');
const router = express.Router();
const db = require('../config/db'); // Import the database connection pool

// Example API endpoint: Get all users (keep if needed, otherwise remove)
router.get('/users', async (req, res) => {
    try {
        const [rows] = await db.execute('SELECT * FROM users');
        res.json(rows);
    } catch (error) {
        console.error('Error fetching users:', error);
        res.status(500).json({ error: 'Failed to retrieve users' });
    }
});

// Example API endpoint: Add a new user (keep if needed, otherwise remove)
router.post('/users', async (req, res) => {
    const { name, email } = req.body;
    if (!name || !email) {
        return res.status(400).json({ error: 'Name and email are required' });
    }
    try {
        const [result] = await db.execute('INSERT INTO users (name, email) VALUES (?, ?)', [name, email]);
        res.status(201).json({ message: 'User added successfully', id: result.insertId });
    } catch (error) {
        console.error('Error adding user:', error);
        res.status(500).json({ error: 'Failed to add user' });
    }
});


// NEW API ENDPOINT: Get photos for a specific category (e.g., Wedding)
// This logic is directly in the route handler, without a separate controller
router.get('/photos/:categoryName', async (req, res) => {
    const categoryName = req.params.categoryName; // e.g., 'wedding'

    try {
        // First, find the category ID
        // Note: We append ' Photography' because your category names in DB are like 'Wedding Photography'
        const [categoryRows] = await db.execute('SELECT id FROM categories WHERE name = ?', [categoryName + ' Photography']);

        if (categoryRows.length === 0) {
            // Log a more specific error for debugging
            console.warn(`Category '${categoryName} Photography' not found in database.`);
            return res.status(404).json({ error: `Category '${categoryName}' not found.` });
        }

        const categoryId = categoryRows[0].id;

        // Then, fetch photos for that category ID
        const [photoRows] = await db.execute('SELECT image_url, title, description FROM photos WHERE category_id = ? ORDER BY uploaded_at DESC', [categoryId]);

        res.json(photoRows);

    } catch (error) {
        console.error(`Error fetching photos for category '${categoryName}':`, error);
        res.status(500).json({ error: 'Failed to retrieve photos' });
    }
});

module.exports = router;