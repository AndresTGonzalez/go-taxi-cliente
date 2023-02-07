// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({
    required this.usuario,
    required this.contrasenia,
    required this.nombre,
    required this.apellido,
  });

  String usuario;
  String contrasenia;
  String nombre;
  String apellido;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        usuario: json["usuario"],
        contrasenia: json["contrasenia"],
        nombre: json["nombre"],
        apellido: json["apellido"],
      );

  Map<String, dynamic> toJson() => {
        "usuario": usuario,
        "contrasenia": contrasenia,
        "nombre": nombre,
        "apellido": apellido,
      };
}
