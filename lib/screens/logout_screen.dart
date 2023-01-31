import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  const LogoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              // color: Colors.red,
              child: Text(
                'Tu cuenta',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Archivo-Bold',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
