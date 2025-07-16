// routes/controllers/PhotoController.js
const PhotoModel = require('../../models/Photo'); // Path might vary depending on exact structure

class PhotoController {
    static async getWeddingPhotos(req, res) {
        try {
            const photos = await PhotoModel.getWeddingPhotos();
            res.json(photos);
        } catch (error) {
            console.error('Error in PhotoController - getWeddingPhotos:', error);
            res.status(500).json({ error: 'Failed to retrieve wedding photos' });
        }
    }

    // You could add methods like static async getPhotosByCategory(req, res) etc.
}

module.exports = PhotoController;