import 'package:flutter/material.dart';
import 'package:tellme/loginpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tellme',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(74, 190, 182, 1),
      ),
      home: const Loginpage(),
    );
  }
}
