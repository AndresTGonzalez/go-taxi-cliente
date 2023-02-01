import 'package:flutter/material.dart';

class AgregarCarreraProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String ubicacionActual = '';
  String callePrincipal = '';
  String calleSecundaria = '';
  String referencia = '';
  String barrio = '';

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
}
