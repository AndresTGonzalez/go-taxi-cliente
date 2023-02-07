import 'dart:convert';

import 'package:app_distribuidas_cliente/models/solicitudes.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../utils/sesion.dart';

class HistorialProviader extends ChangeNotifier {
  List historial = [];

  HistorialProviader() {
    getSolicitudes();
  }

  final String _baseUrl = '34.23.106.197:3000';

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future getSolicitudes() async {
    final url = Uri.http(_baseUrl, '/api/viajes/${Sesion.usuario.usuario}');
    final resp = await http.get(url);
    // solicitudes.addAll(jsonDecode(resp.body));
    if (resp.statusCode == 200) {
      var sol = jsonDecode(resp.body);
      for (sol in sol) {
        historial.add(Solicitud.fromJson(sol));
      }
    }
    notifyListeners();
  }
}
