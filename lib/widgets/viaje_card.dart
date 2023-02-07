import 'package:app_distribuidas_cliente/models/solicitudes.dart';
import 'package:app_distribuidas_cliente/providers/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViajeCard extends StatelessWidget {
  final Solicitud solicitud;

  const ViajeCard({super.key, required this.solicitud});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: _ViajeCardContent(solicitud: solicitud),
      create: (context) => CardProvider(solicitud.id!),
    );
  }
}

class _ViajeCardContent extends StatelessWidget {
  const _ViajeCardContent({
    super.key,
    required this.solicitud,
  });

  final Solicitud solicitud;

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 15, bottom: 25),
        width: double.infinity,
        height: 200,
        // color: Colors.red,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
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
                style: TextStyle(
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
                '${solicitud.callePrincipal!} ${solicitud.calleSecundaria!}',
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
            Container(
              width: 250,
              height: 40,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 1),
              child: MaterialButton(
                color: Color(0xffFF1D15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                disabledColor: Colors.grey,
                elevation: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    'Cancelar',
                    style: const TextStyle(
                      fontFamily: 'Archivo-Bold',
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  cardProvider.cancelarSolicitud();
                  // Navigator.pushNamed(context, 'home');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
