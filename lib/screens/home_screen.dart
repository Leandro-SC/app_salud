import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salud Mental'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildMenuButton(context, 'Seguimiento del Estado de Ánimo', Icons.mood, '/mood_tracking'),
            _buildMenuButton(context, 'Terapias Digitales', Icons.healing, '/therapy'),
            _buildMenuButton(context, 'Recursos Educativos', Icons.book, '/resources'),
            _buildMenuButton(context, 'Citas', Icons.calendar_today, '/appointments'),
            _buildMenuButton(context, 'Chat con Terapeutas', Icons.chat, '/chat'),
            _buildMenuButton(context, 'Perfil', Icons.person, '/profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, IconData icon, String route) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () => Navigator.pushNamed(context, route),
      ),
    );
  }


}

@override
void initState() {
  initState();

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Mensaje recibido: ${message.notification?.title}');
    // Mostrar notificación dentro de la app si es necesario
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    print('Notificación clickeada!');
  });
}
