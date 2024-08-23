import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../widgets/therapy_card.dart';

class TherapyScreen extends StatelessWidget {
  const TherapyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Terapias Digitales')),
      body: FutureBuilder(
        future: ApiService().get('/therapies'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error al cargar terapias'));
          } else {
            final therapies = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: therapies.length,
              itemBuilder: (context, index) {
                return TherapyCard(therapy: therapies[index]);
              },
            );
          }
        },
      ),
    );
  }
}
