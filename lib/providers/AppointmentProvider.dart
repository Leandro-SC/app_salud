import 'package:app_salud/models/appointment_Class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppointmentProvider with ChangeNotifier {
  List<DateTime> availableSlots = [];
  bool isLoading = false;

  Future<void> fetchAvailableSlots(String professionalId, DateTime date) async {
    isLoading = true;
    notifyListeners();
    
    final response = await http.get(Uri.parse('http://localhost:5000/api/availability/get/$professionalId?date=$date'));

    if (response.statusCode == 200) {
      List<dynamic> slots = json.decode(response.body);
      availableSlots = slots.map((slot) => DateTime.parse(slot)).toList();
    } else {
      availableSlots = [];
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> bookAppointment(Appointment appointment) async {
    final response = await http.post(
      Uri.parse('http://localhost:5000/api/appointments/book'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'professionalId': appointment.professionalId,
        'dateTime': appointment.dateTime.toIso8601String(),
        'type': appointment.type,
      }),
    );

    if (response.statusCode == 200) {
      // Muestra mensaje de éxito o navega a otra pantalla
    } else {
      // Maneja el error
    }
  }
}
