const express = require('express');
const Availability = require('../models/Availability');
const router = express.Router();

// Configurar disponibilidad
router.post('/set', async (req, res) => {
  const { professionalId, dayOfWeek, startTime, endTime, appointmentDuration } = req.body;

  try {
    const availability = new Availability({
      professionalId,
      dayOfWeek,
      startTime,
      endTime,
      appointmentDuration,
    });

    await availability.save();
    res.status(201).json({ message: 'Disponibilidad configurada correctamente.' });
  } catch (error) {
    res.status(500).json({ message: 'Error al configurar disponibilidad.' });
  }
});

// Obtener disponibilidad
router.get('/get/:professionalId', async (req, res) => {
  const { professionalId } = req.params;

  try {
    const availability = await Availability.find({ professionalId });
    res.json(availability);
  } catch (error) {
    res.status(500).json({ message: 'Error al obtener disponibilidad.' });
  }
});

module.exports = router;
