import 'package:flutter/material.dart';
import 'package:polartern_assignment/src/screens/home_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PolarTern',
      color: Colors.white,
      theme: ThemeData(fontFamily: 'OpenSans'),
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
