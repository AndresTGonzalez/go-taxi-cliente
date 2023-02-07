import 'dart:convert';

import 'package:app_distribuidas_cliente/models/solicitudes.dart';
import 'package:app_distribuidas_cliente/providers/solicitudes_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CardProvider extends ChangeNotifier {
  final String _baseUrl = '34.23.106.197:3000';
  bool _isLoading = false;
  final int id;

  CardProvider(this.id);

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future cancelarSolicitud() async {
    final url = Uri.http(_baseUrl, '/api/viajes/$id');
    final resp = await http.put(url);
    SolicitudesProvider sol = SolicitudesProvider();
    sol.getSolicitudes();
    // print(jsonDecode(resp.body));
    // print('hola');
    notifyListeners();
  }
}
