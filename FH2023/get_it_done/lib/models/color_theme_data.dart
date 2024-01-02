// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class ColorThemeData extends ChangeNotifier {
  final ThemeData greenTheme = ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.green,
    //accentColor: Colors.green,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.green,
    ),
    scaffoldBackgroundColor: Colors.green,
    appBarTheme: const AppBarTheme(
      color: Colors.green,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Colors.white),
      headlineLarge: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
    ),
  );

  final ThemeData redTheme = ThemeData(
    primaryColor: Colors.red,
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Colors.red,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.red,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.red,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Colors.white),
      headlineLarge: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
    ),
  );

  ThemeData _selectedThemeData = ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: Colors.green,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.green,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.green,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: Colors.white),
      headlineLarge: TextStyle(color: Colors.white),
      displaySmall: TextStyle(color: Colors.white),
    ),
  );

  void changeTheme(bool selected) {
    _selectedThemeData = selected ? redTheme : greenTheme;
    notifyListeners();
  }

  ThemeData get selectedThemeData => _selectedThemeData;
}
