import 'package:app_salud/screens/appointment_screen.dart';
import 'package:app_salud/screens/chat_screen.dart';
import 'package:app_salud/screens/mood_tracking_screen.dart';
import 'package:app_salud/screens/profile_screen.dart';
import 'package:app_salud/screens/resources_screen.dart';
import 'package:app_salud/screens/therapy_screen.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salud Mental',
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/mood_tracking': (context) => const MoodTrackingScreen(),
        '/therapy': (context) => const TherapyScreen(),
        '/resources': (context) => const ResourcesScreen(),
        '/appointments': (context) => const AppointmentScreen(),
        '/chat': (context) => const ChatScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
