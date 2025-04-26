const express = require('express');
const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const bodyParser = require('body-parser');
const dbConfig = require('./configurations/mongo-configuration');
const User = require('./models/userModel');
const Pet = require('./models/pet'); 
const locationRoutes = require('./routes/location'); 
const appointment = require('./models/appointment');
const vet = require('./models/vet');

const app = express();
app.use(bodyParser.json());


app.get('/test', (req, res) => {
    res.send('Test route works!');
});

// Register a new user
app.post('/api/register', async(req, res) => {
    const { email, password } = req.body;

    const userExists = await User.findOne({ email });
    if (userExists) {
        return res.status(400).json({ message: 'Email already exists' });
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    try {
        const newUser = new User({
            email,
            password: hashedPassword
        });
        await newUser.save();
        res.status(201).json({ message: 'User registered successfully' });
    } catch (error) {
        res.status(500).json({ message: 'Server error' });
    }
});

// Login route
app.post('/api/login', async (req, res) => {
    const { email, password } = req.body;

    try {
        const user = await User.findOne({ email });
        if (!user) {
            return res.status(400).json({ message: 'Invalid email or password' });
        }

        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ message: 'Invalid email or password' });
        }

        res.status(200).json({ message: 'Login successful', userId: user._id });
    } catch (error) {
        res.status(500).json({ message: 'Server error' });
    }
});

// Fetch pets
app.get('/api/pets/:id', async (req, res) => {
    try {
        const petId = req.params.id;
        const pet = await Pet.findById(petId);
        if (!pet) return res.status(404).json({ error: 'Pet not found' });

        res.json(pet);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});


app.use('/api', locationRoutes);


// Book an appointment
app.post('/api/appointments', async (req, res) => {
    try {
      const { userId, vetId, date, time } = req.body;
  
      const appointment = new Appointment({
        userId,
        vetId,
        date,
        time
      });
  
      await appointment.save();
  
      res.status(201).json({ message: 'Appointment booked successfully!' });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Failed to book appointment' });
    }
  });


// db connection
mongoose.connect(dbConfig.mongoURI)
    .then(() => console.log('Database connected'))
    .catch((err) => console.log('Database connection error:', err));


const PORT = 8080;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});
