import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'appointment_provider.dart';

class AppointmentScreen extends StatelessWidget {
  final String professionalId;

  const AppointmentScreen({Key? key, required this.professionalId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appointmentProvider = Provider.of<AppointmentProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Agendar Cita')),
      body: Column(
        children: [
          TableCalendar(
            onDaySelected: (selectedDay, focusedDay) {
              appointmentProvider.fetchAvailableSlots(professionalId, selectedDay);
            },
          ),
          if (appointmentProvider.isLoading)
            const CircularProgressIndicator(),
          if (!appointmentProvider.isLoading && appointmentProvider.availableSlots.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: appointmentProvider.availableSlots.length,
                itemBuilder: (context, index) {
                  final slot = appointmentProvider.availableSlots[index];
                  return ListTile(
                    title: Text('Hora: ${slot.hour}:${slot.minute}'),
                    onTap: () {
                      _showBookingDialog(context, slot);
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }

  void _showBookingDialog(BuildContext context, DateTime slot) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Seleccionar Tipo de Cita'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  _bookAppointment(context, slot, 'in_person');
                },
                child: const Text('En Consultorio'),
              ),
              ElevatedButton(
                onPressed: () {
                  _bookAppointment(context, slot, 'video_call');
                },
                child: const Text('Videollamada'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _bookAppointment(BuildContext context, DateTime slot, String type) {
    final appointmentProvider = Provider.of<AppointmentProvider>(context, listen: false);
    appointmentProvider.bookAppointment(Appointment(
      dateTime: slot,
      type: type,
      professionalId: professionalId,
    ));
    Navigator.of(context).pop(); // Cerrar el diálogo
  }
}
