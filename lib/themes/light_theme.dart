import 'package:flutter/material.dart';

class LightTheme {
  ThemeData themedata = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.grey[200],
      background: Colors.white,
      surface: Colors.indigo[300],
    ),
    textSelectionColor: Colors.indigo[300],
    textSelectionHandleColor: Colors.indigo[300],
    cursorColor: Colors.indigo[300],
  );
}
