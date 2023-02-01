import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  PageController _pageController = PageController();

  int _paginaActual = 0;

  int get paginaActual => _paginaActual;

  set paginaActual(int valor) {
    _paginaActual = valor;
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
