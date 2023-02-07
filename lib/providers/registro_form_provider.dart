import 'dart:convert';

import 'package:app_distribuidas_cliente/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistroProvider extends ChangeNotifier {
  final String _baseUrl = '34.23.106.197:3000';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String repeatPassword = '';
  String nombre = '';
  String apellido = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    // print('$email - $password');
    return formKey.currentState?.validate() ?? false;
  }

  Future<bool> createUsuario(Usuario usuario) async {
    final url = Uri.http(_baseUrl, '/api/clientes');
    final resp = await http.post(url,
        body: jsonEncode({
          "usuario": usuario.usuario,
          "contrasenia": usuario.contrasenia,
          "nombre": usuario.nombre,
          "apellido": usuario.apellido
        }),
        headers: {"Content-Type": "application/json"});
    if (resp.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
