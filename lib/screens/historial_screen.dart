import 'package:flutter/material.dart';

import '../widgets/viaje_card.dart';

class Historial extends StatelessWidget {
  const Historial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  'Tu historial',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Archivo-Bold',
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  // color: Colors.red,
                  child: ListView.builder(
                    itemBuilder: (context, index) => ViajeCard(),
                    itemCount: 5,
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
