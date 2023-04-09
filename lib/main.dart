import 'package:flutter/material.dart';
import 'package:quote_bank/pages/home.dart';
import 'package:quote_bank/pages/add_quote.dart';
import 'package:quote_bank/pages/about.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: Colors.black,
          secondary: Colors.grey[400],
          background: Colors.white,
          surface: Colors.indigo[200],
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.grey[900],
          background: Colors.black,
          surface: Colors.indigo[800],
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home' : (context) => Home(),
        '/addQuote' : (context) => AddQuote(),
        '/about' : (context) => About(),
      }
  ));
}
