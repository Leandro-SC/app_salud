const mongoose = require('mongoose');

const appointmentSchema = new mongoose.Schema({
  professionalId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  clientId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
  date: { type: Date, required: true },
  duration: { type: Number, required: true }, // Duración en minutos
  type: { type: String, enum: ['in_person', 'video_call'], required: true },
  meetLink: { type: String }, // Enlace de Google Meet si es por videollamada
  paymentStatus: { type: String, enum: ['pending', 'paid'], default: 'pending' },
});

const Appointment = mongoose.model('Appointment', appointmentSchema);

module.exports = Appointment;
