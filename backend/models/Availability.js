const mongoose = require('mongoose');

const availabilitySchema = new mongoose.Schema({
  professionalId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  dayOfWeek: { type: Number, required: true }, // 0 (Sunday) to 6 (Saturday)
  startTime: { type: String, required: true }, // '09:00' format
  endTime: { type: String, required: true }, // '17:00' format
  appointmentDuration: { type: Number, required: true }, // En minutos
});

const Availability = mongoose.model('Availability', availabilitySchema);

module.exports = Availability;
