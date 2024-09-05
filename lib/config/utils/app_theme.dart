import 'package:flutter/material.dart';


const List<Color> _colorThemes = [
  Color.fromRGBO(36, 46, 74, 0),
  Color.fromRGBO(226,227,226,50)
];

class AppTheme {
  final TextTheme textThemes = const TextTheme(
    titleLarge: TextStyle(fontSize: 22, color: Colors.black, fontWeight:FontWeight.w600),
    bodyLarge: TextStyle(fontSize: 22,color: Colors.black),
    bodyMedium: TextStyle(fontSize:20, color: Colors.black),
    bodySmall: TextStyle(fontSize: 12, color: Colors.black),
  );
  
  final Color backgroundColor = _colorThemes[1];

    ThemeData theme() {
    return ThemeData(textTheme: textThemes, scaffoldBackgroundColor: backgroundColor);
  }
}
