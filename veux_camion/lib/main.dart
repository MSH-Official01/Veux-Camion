import 'package:flutter/material.dart';
import 'package:veux_camion/Features/Main_Home/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Veux Camion',
      debugShowCheckedModeBanner: false,
      home: HomeScreenPage(),
    );
  }
}
