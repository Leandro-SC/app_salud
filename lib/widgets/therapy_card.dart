import 'package:flutter/material.dart';

class TherapyCard extends StatelessWidget {
  final dynamic therapy;

  const TherapyCard({Key? key, required this.therapy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(therapy['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(therapy['description']),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // Navegar a la terapia seleccionada
        },
      ),
    );
  }
}
