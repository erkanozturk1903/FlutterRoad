// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ColorThemeData extends ChangeNotifier {
  final ThemeData greenTheme = ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.green,
    //accentColor: Colors.green,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
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
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
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
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
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

  bool _isGreenTheme = true;
  static late SharedPreferences _sharedPreferences;

  void changeTheme(bool selected) {
    _isGreenTheme = selected;
    notifyListeners();
  }

  bool get isGreenTheme => _isGreenTheme;
  ThemeData get selectedThemeData => _isGreenTheme ? greenTheme : redTheme;

  Future<void> createPrefObject() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveThemeData(bool value) async {
    _sharedPreferences.setBool('isGreenTheme', value);
  }

  Future<void> loadThemeData() async {
    await createPrefObject();
    _isGreenTheme = _sharedPreferences.getBool('isGreenTheme') ?? true;
  }
}
