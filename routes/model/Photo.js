// models/Photo.js
const db = require('../config/db');

class Photo {
    static async getWeddingPhotos() {
        try {
            // Get category ID for 'Wedding Photography'
            const [categoryRows] = await db.execute('SELECT id FROM categories WHERE name = ?', ['Wedding Photography']);
            if (categoryRows.length === 0) {
                return []; // No wedding category found
            }
            const categoryId = categoryRows[0].id;

            // Fetch photos for that category
            const [photos] = await db.execute('SELECT image_url, title, description FROM photos WHERE category_id = ? ORDER BY uploaded_at DESC', [categoryId]);
            return photos;
        } catch (error) {
            console.error('Error in Photo model - getWeddingPhotos:', error);
            throw error; // Propagate error for controller to handle
        }
    }

    // You could add methods like static async getPhotosByCategory(categoryName) etc.
}

module.exports = Photo;