const express = require('express');
const mongoose = require('mongoose');
const dotenv = require('dotenv');
const authRoutes = require('./routes/auth');
const bodyParser = require('body-parser');
const chatRoutes = require('./routes/chat');
app.use('/api/chat', chatRoutes);

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

const Chat = require('./models/Chat'); // Importar el modelo Chat

io.on('connection', (socket) => {
  console.log('Usuario conectado:', socket.id);

  socket.on('sendMessage', async ({ senderId, receiverId, message }) => {
    const chatMessage = {
      senderId,
      receiverId,
      message,
      timestamp: new Date(),
    };

    // Guardar el mensaje en la base de datos
    await Chat.create(chatMessage);

    // Emitir el mensaje al receptor
    io.to(receiverId).emit('receiveMessage', chatMessage);
  });

  socket.on('disconnect', () => {
    console.log('Usuario desconectado:', socket.id);
  });
});

