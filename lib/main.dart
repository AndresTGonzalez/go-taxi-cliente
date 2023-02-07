import 'package:app_distribuidas_cliente/screens/crear_viaje_screen.dart';
import 'package:app_distribuidas_cliente/screens/registro_screen.dart';
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
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginScreen(),
        'home': (context) => HomeScreen(),
        'viaje': (context) => CrearViaje(),
        'registro': (context) => Registro(),
      },
    );
  }
}
