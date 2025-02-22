import 'package:apiprojects/homepage.dart';
import 'package:apiprojects/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
///API Link..
///https://www.sparkstoideas.com/LJ/api/register
///https://www.sparkstoideas.com/LJ/api/login
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: RegisterPage(),
    );
  }
}


