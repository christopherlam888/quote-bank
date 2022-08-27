import 'package:flutter/material.dart';
import 'package:quote_bank/pages/home.dart';
import 'package:quote_bank/pages/add_quote.dart';
import 'package:quote_bank/pages/about.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home' : (context) => Home(),
        '/addQuote' : (context) => AddQuote(),
        '/about' : (context) => About(),
      }
  ));
}
