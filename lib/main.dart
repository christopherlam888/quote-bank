import 'package:flutter/material.dart';
import 'package:quote_bank/pages/home.dart';
import 'package:quote_bank/pages/add_quote.dart';
import 'package:quote_bank/pages/about.dart';
import 'package:quote_bank/themes/light_theme.dart';
import 'package:quote_bank/themes/dark_theme.dart';

void main() {
  runApp(MaterialApp(
      theme: LightTheme().themedata,
      darkTheme: DarkTheme().themedata,
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home' : (context) => Home(),
        '/addQuote' : (context) => AddQuote(),
        '/about' : (context) => About(),
      }
  ));
}
