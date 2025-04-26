const mongoose = require('mongoose');

const vaccinationSchema = new mongoose.Schema({
    name: String,
    date: String
});

const medicationSchema = new mongoose.Schema({
    name: String,
    dosage: String
});

const petSchema = new mongoose.Schema({
    ownerId: {
        type: mongoose.Schema.Types.ObjectId,
        required: true,
        ref: 'User'
    },
    name: String,
    species: String,
    breed: String,
    age: Number,
    gender: String,
    weightKg: Number,
    vaccinations: [vaccinationSchema],
    medications: [medicationSchema],
    createdAt: {
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('Pet', petSchema);