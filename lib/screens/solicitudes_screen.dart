import 'package:flutter/material.dart';

class Solicitudes extends StatelessWidget {
  const Solicitudes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
                // color: Colors.red,
                child: Text(
                  'Bienvenido',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Archivo-Bold',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
