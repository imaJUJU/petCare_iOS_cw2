const express = require('express');
const router = express.Router();
const Location = require('../models/location');

router.get('/locations', async (req, res) => {
    try {
        const locations = await Location.find();
        res.json(locations); 
    } catch (err) {
        res.status(500).json({ message: 'Error fetching locations', error: err });
    }
});

module.exports = router;