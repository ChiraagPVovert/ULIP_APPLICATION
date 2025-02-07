import 'package:flutter/material.dart';
import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Logistics App',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(), // This links to the HomeScreen in home.dart
    );
  }
}
