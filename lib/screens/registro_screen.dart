import 'package:app_distribuidas_cliente/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/registro_form_provider.dart';
import '../ui/ui.dart';

class Registro extends StatelessWidget {
  const Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              _logo(),
              _title(),
              _formContainer()
            ],
          ),
        ),
      ),
    );
  }

  Container _title() {
    return Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.centerLeft,
      // color: Colors.red,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: const Text(
        'Regístrate',
        style: TextStyle(
            fontSize: 35,
            fontFamily: 'Archivo-Bold',
            fontWeight: FontWeight.w700),
      ),
    );
  }

  Container _formContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: ChangeNotifierProvider(
        create: (context) => RegistroProvider(),
        child: const _LoginForm(),
      ),
    );
  }

  Container _logo() {
    return Container(
      // color: Colors.red,
      alignment: Alignment.bottomLeft,
      // height: 75,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Image.asset(
        'assets/images/logo.png',
        width: 250,
        alignment: Alignment.bottomLeft,
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final registroForm = Provider.of<RegistroProvider>(context);
    return Container(
      child: Form(
        key: registroForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: true,
              onChanged: (value) => registroForm.nombre = value,
              // obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecor.authInputDecoration(
                  hintText: 'Alejandro',
                  labelText: 'Nombre',
                  color: Color(0xff202020),
                  prefixIcon: Icons.badge),
            ),
            _formSizeBox(),
            TextFormField(
              autocorrect: true,
              onChanged: (value) => registroForm.apellido = value,
              // obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecor.authInputDecoration(
                  hintText: 'Rocano',
                  labelText: 'Apellido',
                  color: Color(0xff202020),
                  prefixIcon: Icons.badge),
            ),
            _formSizeBox(),
            TextFormField(
              autocorrect: false,
              // onChanged: (value) => ,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Correo electrónico incorrecto';
              },
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                registroForm.email = value;
              },
              decoration: InputDecor.authInputDecoration(
                color: Color(0xff202020),
                hintText: 'jhon.doe@gmail.com',
                labelText: 'Correo electrónico',
                prefixIcon: Icons.alternate_email,
              ),
            ),
            _formSizeBox(),
            TextFormField(
              autocorrect: false,
              validator: (value) {
                if (value != null && value.length >= 6) {
                  return null;
                } else {
                  return 'Contraseña mínima de 6 caracteres';
                }
              },
              onChanged: (value) => registroForm.password = value,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecor.authInputDecoration(
                  hintText: '***********',
                  labelText: 'Contraseña',
                  color: const Color(0xff202020),
                  prefixIcon: Icons.lock),
            ),
            _formSizeBox(),
            TextFormField(
              autocorrect: false,
              validator: (value) {
                if (value == registroForm.password) {
                  return null;
                } else {
                  return 'Las contraseñas no coinciden';
                }
              },
              onChanged: (value) => registroForm.repeatPassword = value,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecor.authInputDecoration(
                  hintText: '***********',
                  labelText: 'Repita la contraseña',
                  color: const Color(0xff202020),
                  prefixIcon: Icons.lock),
            ),
            _formSizeBox(),
            MaterialButton(
              onPressed: () async {
                Usuario usuario = Usuario(
                    usuario: registroForm.email,
                    contrasenia: registroForm.password,
                    nombre: registroForm.nombre,
                    apellido: registroForm.apellido);
                if (await registroForm.createUsuario(usuario)) {
                  // ignore: use_build_context_synchronously
                  _showToast(context);
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacementNamed(context, 'login');
                } else {
                  // ignore: use_build_context_synchronously
                  _showToastError(context);
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Color(0xffFFF000),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  'Registrarse',
                  style: TextStyle(
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Color(0xff202020),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'login');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Color(0xff202020),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  'Volver al inicio',
                  style: TextStyle(
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            _formSizeBox()
          ],
        ),
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Usuario creado correctamente'),
        action: SnackBarAction(
            label: 'Ocultar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  void _showToastError(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Hubo un error al crear el usuario'),
        action: SnackBarAction(
            label: 'Ocultar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  SizedBox _formSizeBox() {
    return const SizedBox(
      height: 30,
      width: double.infinity,
    );
  }
}
