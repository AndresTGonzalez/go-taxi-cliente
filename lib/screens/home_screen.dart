import 'package:app_distribuidas_cliente/screens/logout_screen.dart';
import 'package:app_distribuidas_cliente/screens/solicitudes_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogoutScreen(),
    );
  }
}
