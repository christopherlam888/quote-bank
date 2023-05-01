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
  );
}