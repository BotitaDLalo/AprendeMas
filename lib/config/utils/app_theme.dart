import 'package:flutter/material.dart';

const List<Color> _colorThemes = [
  Color(0xD9D9D9D9),
];

class AppTheme {
  final TextTheme textThemes = const TextTheme(
    titleLarge: TextStyle(
        fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(fontSize: 22, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 20, color: Colors.black),
    bodySmall: TextStyle(fontSize: 14, color: Colors.black),
  );

  final Color backgroundColor = _colorThemes[0];

  ThemeData theme() {
    return ThemeData(
        textTheme: textThemes, scaffoldBackgroundColor: backgroundColor);
  }
}
