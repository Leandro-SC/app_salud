import 'package:app_salud/screens/appointment_screen.dart';
import 'package:app_salud/screens/chat_screen.dart';
import 'package:app_salud/screens/mood_tracking_screen.dart';
import 'package:app_salud/screens/profile_screen.dart';
import 'package:app_salud/screens/resources_screen.dart';
import 'package:app_salud/screens/therapy_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'theme/theme.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print('Mensaje en segundo plano: ${message.messageId}');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salud Mental',
      theme: appTheme,
      home: const ChatScreen(userId: 'user_id', professionalId: 'professional_id'),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/mood_tracking': (context) => const MoodTrackingScreen(),
        '/therapy': (context) => const TherapyScreen(),
        '/resources': (context) => const ResourcesScreen(),
        '/appointments': (context) => const AppointmentScreen(),
        '/profile': (context) => const ProfileScreen(),
      },

    );
  }
}
