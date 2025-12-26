import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,

      scaffoldBackgroundColor: const Color(0xFFF5F1EB),

      colorScheme: const ColorScheme.light(
        primary: Color(0xFF4E342E),     // Marrón oscuro
        secondary: Color(0xFF6D4C41),   // Marrón medio
        surface: Color(0xFFE8E0D5),     // Cards
        background: Color(0xFFF5F1EB),
        onPrimary: Colors.white,
        onSurface: Color(0xFF1C1C1C),
      ),

      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFFF5F1EB),
        foregroundColor: Color(0xFF1C1C1C),
        elevation: 0,
        centerTitle: false,
      ),


      listTileTheme: const ListTileThemeData(
        iconColor: Color(0xFF4E342E),
        textColor: Color(0xFF1C1C1C),
      ),

      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF1C1C1C),
        ),
        titleMedium: TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xFF4E342E),
        ),
        bodyMedium: TextStyle(
          color: Color(0xFF1C1C1C),
        ),
      ),
    );
  }
}
