import 'package:flutter/material.dart';
import '../services/api_service.dart';

class MoodTrackingScreen extends StatefulWidget {
  const MoodTrackingScreen({Key? key}) : super(key: key);

  @override
  _MoodTrackingScreenState createState() => _MoodTrackingScreenState();
}

class _MoodTrackingScreenState extends State<MoodTrackingScreen> {
  void _saveMood(String mood) async {
    await ApiService().post('/mood', {'mood': mood});
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seguimiento del Estado de Ánimo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('¿Cómo te sientes hoy?', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            _buildMoodButton(context, 'Feliz', Colors.yellow),
            _buildMoodButton(context, 'Triste', Colors.blue),
            _buildMoodButton(context, 'Ansioso', Colors.red),
            _buildMoodButton(context, 'Relajado', Colors.green),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodButton(BuildContext context, String mood, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Reemplaza `primary` por `backgroundColor`
        foregroundColor: Colors.white, // Reemplaza `onPrimary` por `foregroundColor`
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text(mood),
      onPressed: () => _saveMood(mood),
    );
  }
}
