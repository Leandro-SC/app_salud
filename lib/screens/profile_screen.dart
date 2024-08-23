import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Nombre de Usuario'),
              subtitle: Text('usuario@example.com'),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configuraciones'),
              onTap: () {
                // Navegar a configuraciones
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Cerrar Sesión'),
              onTap: () {
                // Cerrar sesión
              },
            ),
          ],
        ),
      ),
    );
  }
}
