import 'dart:convert';

import 'package:app_distribuidas_cliente/models/usuario.dart';
import 'package:app_distribuidas_cliente/utils/ip.dart';
import 'package:app_distribuidas_cliente/utils/sesion.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class LoginFormProvider extends ChangeNotifier {
  Usuario usuario =
      Usuario(usuario: '', contrasenia: '', nombre: '', apellido: '');

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final String _baseUrl = IP.ip;

  String email = '';
  String password = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print('$email - $password');
    return formKey.currentState?.validate() ?? false;
  }

  Future<bool> login(Usuario usuario) async {
    final url = Uri.http(_baseUrl, '/api/clientes/${usuario.usuario}');
    final resp = await http.post(url,
        body: jsonEncode({"contrasenia": usuario.contrasenia}),
        headers: {"Content-Type": "application/json"});
    if (resp.statusCode == 404) {
      return false;
    } else {
      this.usuario.usuario = usuario.usuario;
      Sesion.usuario.usuario = usuario.usuario;
      print(this.usuario.usuario);
      return true;
    }
  }
}
