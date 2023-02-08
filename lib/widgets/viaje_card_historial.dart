import 'package:app_distribuidas_cliente/models/solicitudes.dart';
import 'package:app_distribuidas_cliente/providers/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViajeCardHistorial extends StatelessWidget {
  const ViajeCardHistorial({super.key, required this.solicitud});

  final Solicitud solicitud;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardProvider(0),
      child: _CardContent(
        solicitud: solicitud,
      ),
    );
  }
}

class _CardContent extends StatelessWidget {
  final Solicitud solicitud;
  const _CardContent({
    required this.solicitud,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 15, bottom: 25),
        width: double.infinity,
        height: 150,
        // color: Colors.red,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 5),
                blurRadius: 10,
              )
            ]),
        // padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              height: 25,
              // color: Colors.red,
              margin: EdgeInsets.only(left: 20, top: 20),
              child: Text(
                solicitud.estado!.toUpperCase(),
                style: const TextStyle(
                    fontFamily: 'Archivo-Bold',
                    color: Color(0xff202020),
                    fontSize: 20),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              height: 15,
              // color: Colors.red,
              margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Text(
                '${solicitud.callePrincipal!} y ${solicitud.calleSecundaria!}',
                style: TextStyle(
                    fontFamily: 'Archivo-Medium',
                    color: Color(0xff202020),
                    fontSize: 15),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              height: 15,
              // color: Colors.red,
              margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Text(
                solicitud.referencia!,
                style: TextStyle(
                    fontFamily: 'Archivo-Medium',
                    color: Color(0xff202020),
                    fontSize: 15),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              height: 15,
              // color: Colors.red,
              margin: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Text(
                solicitud.informacionAdicional!,
                style: TextStyle(
                    fontFamily: 'Archivo-Medium',
                    color: Color(0xff202020),
                    fontSize: 15),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
