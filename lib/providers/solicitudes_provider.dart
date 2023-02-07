import 'dart:convert';

import 'package:app_distribuidas_cliente/models/solicitudes.dart';
import 'package:app_distribuidas_cliente/utils/sesion.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class SolicitudesProvider extends ChangeNotifier {
  List<Solicitud> solicitudes = [];

  final String _baseUrl = '34.23.106.197:3000';

  SolicitudesProvider() {
    getSolicitudes();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future getSolicitudes() async {
    final url = Uri.http(_baseUrl, '/api/clientes/${Sesion.usuario.usuario}');
    final resp = await http.get(url);
    // solicitudes.addAll(jsonDecode(resp.body));
    if (resp.statusCode == 200) {
      var sol = jsonDecode(resp.body);
      for (sol in sol) {
        solicitudes.add(Solicitud.fromJson(sol));
      }
    }
    notifyListeners();
  }
}
