import 'package:flutter/material.dart';
import 'package:quote_bank/pages/home.dart';
import 'package:quote_bank/pages/add_quote.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home' : (context) => Home(),
        '/addQuote' : (context) => AddQuote(),
      }
  ));
}
