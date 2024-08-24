const express = require('express');
const Chat = require('../models/Chat');
const User = require('../models/User');
const router = express.Router();

// Guardar mensaje en el historial
router.post('/saveMessage', async (req, res) => {
  const { senderId, receiverId, message } = req.body;

  try {
    const chatMessage = await Chat.create({ senderId, receiverId, message });
    res.status(201).json(chatMessage);
  } catch (error) {
    res.status(500).json({ message: 'Error al guardar mensaje' });
  }
});

// Obtener historial de chat entre dos usuarios
router.get('/history/:userId/:professionalId', async (req, res) => {
  const { userId, professionalId } = req.params;

  try {
    const history = await Chat.find({
      $or: [
        { senderId: userId, receiverId: professionalId },
        { senderId: professionalId, receiverId: userId },
      ],
    }).sort({ timestamp: 1 });

    res.json(history);
  } catch (error) {
    res.status(500).json({ message: 'Error al obtener historial de chat' });
  }
});

module.exports = router;
