import 'package:app_distribuidas_cliente/models/solicitudes.dart';
import 'package:app_distribuidas_cliente/providers/agregar_carrera_provider.dart';
import 'package:app_distribuidas_cliente/screens/solicitudes_screen.dart';
import 'package:app_distribuidas_cliente/utils/sesion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ui/input_decorations.dart';

class CrearViaje extends StatelessWidget {
  const CrearViaje({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                alignment: Alignment.centerLeft,
                // color: Colors.red,
                child: Text(
                  '¿A donde vamos?',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Archivo-Bold',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: ChangeNotifierProvider(
                    create: (_) => AgregarCarreraProvider(),
                    child: _AgregarForn(),
                  )
                  // _AgregarForn(),
                  )
            ],
          ),
        ),
      ),
    );
  }
}

class _AgregarForn extends StatelessWidget {
  const _AgregarForn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final agregarForm = Provider.of<AgregarCarreraProvider>(context);
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          // TextFormField(
          //   autocorrect: false,
          //   // onChanged: (value) => ,
          //   validator: (value) {
          //     if (value != null && value.length >= 2) {
          //       return null;
          //     } else {
          //       return 'Ingrese una dirección';
          //     }
          //   },
          //   keyboardType: TextInputType.streetAddress,
          //   onChanged: (value) {
          //     // loginForm.email = value;
          //   },
          //   decoration: InputDecor.authInputDecoration(
          //     color: Color(0xff202020),
          //     hintText: 'Calle los Duraznos 0180',
          //     labelText: 'Donde estoy',
          //     // prefixIcon: Icons.alternate_email,
          //   ),
          // ),
          // SizedBox(
          //   height: 25,
          // ),
          TextFormField(
            autocorrect: true,
            // onChanged: (value) => ,
            validator: (value) {
              if (value != null && value.length >= 2) {
                return null;
              } else {
                return 'Ingrese una calle válida';
              }
            },
            keyboardType: TextInputType.text,
            onChanged: (value) {
              // loginForm.email = value;
              agregarForm.callePrincipal = value;
            },
            decoration: InputDecor.authInputDecoration(
              color: Color(0xff202020),
              hintText: 'Av. Bolivariana',
              labelText: 'Calle principal',
              // prefixIcon: Icons.alternate_email,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          TextFormField(
            autocorrect: true,
            // onChanged: (value) => ,
            validator: (value) {
              if (value != null && value.length >= 2) {
                return null;
              } else {
                return 'Ingrese una calle válida';
              }
            },
            keyboardType: TextInputType.text,
            onChanged: (value) {
              // loginForm.email = value;
              agregarForm.calleSecundaria = value;
            },
            decoration: InputDecor.authInputDecoration(
              color: Color(0xff202020),
              hintText: 'Seymur',
              labelText: 'Calle secundaria',
              // prefixIcon: Icons.alternate_email,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          TextFormField(
            autocorrect: false,
            // onChanged: (value) => ,
            validator: (value) {
              if (value != null && value.length >= 2) {
                return null;
              } else {
                return 'Ingrese un barrio válido';
              }
            },
            keyboardType: TextInputType.text,
            onChanged: (value) {
              // loginForm.email = value;
              agregarForm.barrio = value;
            },
            decoration: InputDecor.authInputDecoration(
              color: Color(0xff202020),
              hintText: 'Huachi',
              labelText: 'Barrio o sector',
              // prefixIcon: Icons.alternate_email,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          TextFormField(
            autocorrect: false,
            // onChanged: (value) => ,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              agregarForm.referencia = value;
            },
            decoration: InputDecor.authInputDecoration(
              color: Color(0xff202020),
              hintText: 'Al frente de una tienda',
              labelText: 'Referencia',
              // prefixIcon: Icons.alternate_email,
            ),
          ),
          SizedBox(
            height: 25,
          ),
          TextFormField(
            autocorrect: false,
            // onChanged: (value) => ,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              agregarForm.informacion = value;
            },
            decoration: InputDecor.authInputDecoration(
              color: Color(0xff202020),
              hintText: 'Traer sueltos',
              labelText: 'Información adicional',
              // prefixIcon: Icons.alternate_email,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          MaterialButton(
            onPressed: () async {
              Solicitud solicitud = Solicitud(
                  id: 0,
                  usuario: Sesion.usuario.usuario,
                  callePrincipal: agregarForm.callePrincipal,
                  calleSecundaria: agregarForm.calleSecundaria,
                  referencia: agregarForm.referencia,
                  barrioSector: agregarForm.barrio,
                  informacionAdicional: agregarForm.informacion,
                  taxistaAsignado: '',
                  estado: '');
              if (!await agregarForm.createCarrera(solicitud)) {
                print('Error');
              } else {
                FocusScope.of(context).unfocus();
                await Future.delayed(Duration(seconds: 1));
                Navigator.pushReplacementNamed(context, 'home');
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
              child: Text(
                'Crear solicitud',
                style: TextStyle(
                  color: Color(0xff202020),
                  fontFamily: 'Archivo-Bold',
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
