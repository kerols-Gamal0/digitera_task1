import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData get light {
    final colors = ColorScheme.fromSeed(
      seedColor: const Color(0xff116466),
      brightness: Brightness.light,
    );

    return ThemeData(
      colorScheme: colors,
      scaffoldBackgroundColor: const Color(0xfff7f8fa),
      useMaterial3: true,
      fontFamily: 'Arial',
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xfff7f8fa),
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Color(0xff102a2a),
          fontSize: 21,
          fontWeight: FontWeight.w800,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(color: Color(0xff116466), width: 1.5),
        ),
      ),
      cardTheme: const CardThemeData(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
      ),
    );
  }
}
