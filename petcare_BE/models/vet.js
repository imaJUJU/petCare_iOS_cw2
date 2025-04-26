const mongoose = require('mongoose');

const vetSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  clinicName: {
    type: String,
    required: true
  },
  specialization: {
    type: String
  },
  contactNumber: {
    type: String
  },
  address: {
    type: String
  }
}, { timestamps: true });

module.exports = mongoose.model('Vet', vetSchema);