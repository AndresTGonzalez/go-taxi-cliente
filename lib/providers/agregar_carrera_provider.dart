import 'dart:convert';

import 'package:app_distribuidas_cliente/models/solicitudes.dart';
import 'package:app_distribuidas_cliente/utils/ip.dart';
import 'package:app_distribuidas_cliente/utils/sesion.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AgregarCarreraProvider extends ChangeNotifier {
  final String _baseUrl = IP.ip;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String callePrincipal = '';
  String calleSecundaria = '';
  String referencia = '';
  String barrio = '';
  String informacion = '';
  String referenci = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  Future<bool> createCarrera(Solicitud solicitud) async {
    final url = Uri.http(_baseUrl, '/api/solicitudes');
    final resp = await http.post(
      url,
      body: jsonEncode({
        "usuario": Sesion.usuario.usuario,
        "calle_principal": solicitud.callePrincipal,
        "calle_secundaria": solicitud.calleSecundaria,
        "referencia": solicitud.referencia,
        "barrio_sector": solicitud.barrioSector,
        "informacion_adicional": solicitud.informacionAdicional
      }),
      headers: {"Content-Type": "application/json"},
    );
    if (resp.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
