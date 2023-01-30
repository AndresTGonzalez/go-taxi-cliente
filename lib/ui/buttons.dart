import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Buttons {
  static MaterialButton loginButton({
    required String text,
    required Color textColor,
    required Color background,
  }) {
    return MaterialButton(
      onPressed: () {},
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      disabledColor: Colors.grey,
      elevation: 0,
      color: Color(0xffFFD143),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        alignment: Alignment.center,
        child: Text(
          'text',
          style: TextStyle(
            fontFamily: 'Archivo-Medium',
            fontSize: 15,
            color: Color(0xff202020),
          ),
        ),
      ),
    );
  }
}
