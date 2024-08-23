import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Citas')),
      body: FutureBuilder(
        future: ApiService().get('/appointments'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar citas'));
          } else {
            final appointments = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text('Cita con ${appointment['therapistName']}'),
                    subtitle: Text('Fecha: ${appointment['date']}'),
                    trailing: const Icon(Icons.calendar_today),
                    onTap: () {
                      // Ver detalles de la cita
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
