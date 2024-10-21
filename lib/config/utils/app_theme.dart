import 'package:flutter/material.dart';

const List<Color> _colorThemes = [
  Color.fromARGB(255, 255, 255, 255), //$White
  Color.fromARGB(255, 52, 115, 250), //$Blue
  Color.fromARGB(255, 0, 0, 0), //$ Black
  Color.fromARGB(100, 0, 0, 0), //$Negro palido
  Color.fromARGB(150, 0, 0, 0) //$Negro palido 2
];

class AppTheme {
  final Color backgroundColor = _colorThemes[0];
  final Color buttonColor = _colorThemes[1];
  static const Color pickedColor = Colors.white;
  static final BorderRadius borderRadius = BorderRadius.circular(10);

//#Text theme style
  final TextTheme textThemes = const TextTheme(
    titleLarge: TextStyle(
        fontSize: 22, color: Colors.black, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(
      fontSize: 22,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(fontSize: 20, color: Colors.black),
    bodySmall: TextStyle(fontSize: 14, color: Colors.black),
  );

  //#Color picker box style
  static final BoxDecoration colorPickerBox = BoxDecoration(
      color: Colors.white,
      border: Border.all(color: const Color.fromARGB(120, 0, 0, 0)),
      borderRadius: borderRadius);

//#Buttons styles
  static final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
    backgroundColor: _colorThemes[1],
    fixedSize: const Size.fromHeight(45),
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius, // border radius
    ),
  );

  static final ButtonStyle buttonSecondary = ElevatedButton.styleFrom(
    backgroundColor: _colorThemes[0],
    foregroundColor: _colorThemes[2],
    fixedSize: const Size.fromHeight(45),
    // side: BorderSide(color: _colorThemes[1]),
    side: BorderSide(color: _colorThemes[3]),
    shape: RoundedRectangleBorder(
      borderRadius: borderRadius, // border radius
    ),
  );

  static final ButtonStyle buttonTertiary = ElevatedButton.styleFrom(
    backgroundColor: _colorThemes[0],
    foregroundColor: _colorThemes[4],
    fixedSize: const Size.fromHeight(35),
    side: BorderSide(color: _colorThemes[3]),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50), // border radius
    ),
  );

  // final FilledButtonThemeData filledButtonThemeData = FilledButtonThemeData(
  //     style: ButtonStyle(
  //         backgroundColor: WidgetStatePropertyAll(_colorThemes[1])));

  ThemeData theme() {
    return ThemeData(
        textTheme: textThemes, scaffoldBackgroundColor: backgroundColor);
  }
}
