import 'package:app_distribuidas_cliente/providers/solicitudes_provider.dart';
import 'package:app_distribuidas_cliente/widgets/viaje_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Solicitudes extends StatelessWidget {
  const Solicitudes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SolicitudesProvider(),
      child: _SolicitudesContent(),
    );
  }
}

class _SolicitudesContent extends StatelessWidget {
  const _SolicitudesContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final solicitudesProvider = Provider.of<SolicitudesProvider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'viaje');
        },
        backgroundColor: Color(0xff202020),
        child: Icon(
          Icons.add,
          color: Color(0xffFFF000),
        ),
      ),
      body: SafeArea(
        child: Container(
          // color: Colors.red,
          width: double.infinity,
          // height: 500,
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
                  'Bienvenido',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Archivo-Bold',
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.734,
                  // color: Colors.red,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      print(solicitudesProvider.solicitudes.length);
                      return ViajeCard(
                        solicitud: solicitudesProvider.solicitudes[index],
                      );
                    },
                    itemCount: solicitudesProvider.solicitudes.length,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
