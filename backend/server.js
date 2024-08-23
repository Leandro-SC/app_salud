const express = require('express');
const mongoose = require('mongoose');
const dotenv = require('dotenv');
const authRoutes = require('./routes/auth');
const bodyParser = require('body-parser');

dotenv.config();

const app = express();
app.use(bodyParser.json());

// Conexión a MongoDB
mongoose
  .connect(process.env.MONGO_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
  })
  .then(() => console.log('MongoDB conectado'))
  .catch((err) => console.log(err));

// Rutas de autenticación
app.use('/api/auth', authRoutes);

const PORT = process.env.PORT || 5000;

app.listen(PORT, () => console.log(`Servidor corriendo en puerto ${PORT}`));
