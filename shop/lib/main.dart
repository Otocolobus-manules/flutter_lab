import 'package:flutter/material.dart';
import 'Pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF0F8FF),
      ),
    );
  }
}
