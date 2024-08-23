import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.black87), // Anteriormente bodyText2
    titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), // Anteriormente headline6
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
  ),
  scaffoldBackgroundColor: Colors.white,
);
