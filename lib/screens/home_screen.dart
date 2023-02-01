import 'package:app_distribuidas_cliente/providers/navigation_provider.dart';
import 'package:app_distribuidas_cliente/screens/crear_viaje_screen.dart';
import 'package:app_distribuidas_cliente/screens/historial_screen.dart';
import 'package:app_distribuidas_cliente/screens/logout_screen.dart';
import 'package:app_distribuidas_cliente/screens/solicitudes_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final navigation = Provider.of<NavigationProvider>(context);

    return ChangeNotifierProvider(
      create: (context) => NavigationProvider(),
      child: Scaffold(
        bottomNavigationBar: _Navigation(),
        body: _Paginas(),
      ),
    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationProvider>(context);
    return PageView(
      controller: navigation.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Solicitudes(),
        Historial(),
        LogoutScreen(),
      ],
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navigation = Provider.of<NavigationProvider>(context);
    return BottomNavigationBar(
      currentIndex: navigation.paginaActual,
      unselectedItemColor: Colors.white,
      backgroundColor: Color(0xff202020),
      onTap: (value) => navigation.paginaActual = value,
      fixedColor: Color(0xffFFF000),
      items: [
        BottomNavigationBarItem(
          label: 'Inicio',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: 'Historial',
          icon: Icon(Icons.local_taxi),
        ),
        BottomNavigationBarItem(
          label: 'Usuario',
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}
