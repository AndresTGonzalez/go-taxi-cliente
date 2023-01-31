import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Go Taxi',
      initialRoute: 'home',
      routes: {
        'login': (context) => LoginScreen(),
        'home': (context) => HomeScreen(),
      },
    );
  }
}
