import 'package:flutter/material.dart';

ThemeData customDarkTheme = ThemeData.dark(
  useMaterial3: true,
).copyWith(
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFFBB86FC), //appbars and buttons
    onPrimary: Color(0xFF3700B3),
    secondary: Color(0xFFFFCC80), // Cards
    onSecondary: Color(0xFF5D4037),
    error: Color(0xFFCF6679),
    onError: Color(0xFF000000),
    surface: Color(0xFF1E1E1E), //etc
    onSurface: Color(0xFFFFFFFF),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(
      255, 43, 42, 42), // Set a custom Scaffold background color

  cardTheme: CardTheme(
    color: const Color.fromARGB(
        255, 87, 86, 86), // Slightly lighter than Scaffold for contrast
    elevation: 4,
    shadowColor: // Colors.black.withOpacity(0.100),
        Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF2C2C38),
    titleTextStyle: TextStyle(
      color: Color(0xFFE0E0FF),
      fontFamily: 'Lato',
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),
    iconTheme: IconThemeData(color: Color(0xFFE0E0FF)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF6200EE),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        color: Color(0xFFE0E0FF),
        fontSize: 32,
        fontWeight: FontWeight.bold,
        fontFamily: 'Lato'),
    titleMedium: TextStyle(
        color: Color(0xFFE0E0FF),
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Lato'),
    titleSmall: TextStyle(
      color: Color(0xFFE0E0FF),
      fontSize: 14,
    ),
  ),
);

ThemeData customLightTheme = ThemeData.light(
  useMaterial3: true,
).copyWith(
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF6200EE),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFFFFA726),
    onSecondary: Color(0xFFFFFFFF),
    error: Color(0xFFB00020),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF000000),
  ),
  scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Light gray background

  cardTheme: CardTheme(
    color: Colors.white, // White for light mode
    elevation: 4,
    shadowColor: Colors.grey.withOpacity(0.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontFamily: 'Lato',
      fontWeight: FontWeight.bold,
      fontSize: 25,
    ),
    iconTheme: IconThemeData(color: Color(0xFF6200EE)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF6200EE),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    ),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
        color: Color(0xFF6200EE),
        fontSize: 22,
        fontWeight: FontWeight.bold,
        fontFamily: 'Lato'),
    titleMedium: TextStyle(
        color: Color(0xFF6200EE),
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Lato'),
    titleSmall: TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
  ),
);
