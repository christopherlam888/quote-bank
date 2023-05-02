import 'package:flutter/material.dart';

class DarkTheme {
  ThemeData themedata = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.white,
      secondary: Colors.grey[900],
      background: Colors.black,
      surface: Colors.indigo[800],
    ),
  );
}
