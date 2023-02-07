// To parse this JSON data, do
//
//     final solicitud = solicitudFromJson(jsonString);

import 'dart:convert';

Solicitud solicitudFromJson(String str) => Solicitud.fromJson(json.decode(str));

String solicitudToJson(Solicitud data) => json.encode(data.toJson());

class Solicitud {
  Solicitud({
    required this.id,
    required this.usuario,
    required this.callePrincipal,
    required this.calleSecundaria,
    required this.referencia,
    required this.barrioSector,
    required this.informacionAdicional,
    required this.taxistaAsignado,
    required this.estado,
  });

  int? id;
  String? usuario;
  String? callePrincipal;
  String? calleSecundaria;
  String? referencia;
  String? barrioSector;
  String? informacionAdicional;
  String? taxistaAsignado;
  String? estado;

  factory Solicitud.fromJson(Map<String, dynamic> json) => Solicitud(
        id: json["id"],
        usuario: json["usuario"],
        callePrincipal: json["calle_principal"],
        calleSecundaria: json["calle_secundaria"],
        referencia: json["referencia"],
        barrioSector: json["barrio_sector"],
        informacionAdicional: json["informacion_adicional"],
        taxistaAsignado: json["taxista_asignado"],
        estado: json["estado"],
      );
  // factory Solicitud.fromMap(Map<String, dynamic> json) => Solicitud(
  //     estado: json["estado"],
  //     anio: json["anio"],
  //     marca: json["marca"],
  //     modelo: json["modelo"].toString(),
  //     pago: json["pago"],
  //     imagen: json["imagen"],
  //     precio: json["precio"].toString(),
  //     cilindraje: json["cilindraje"],
  //     id: json["id"]);
  factory Solicitud.fromMap(Map<String, dynamic> json) => Solicitud(
      id: json['id'],
      usuario: json['usuario'],
      callePrincipal: json['callePrincipal'],
      calleSecundaria: json['calleSecundaria'],
      referencia: json['referencia'],
      barrioSector: json['barrioSector'],
      informacionAdicional: json['informacionAdicional'],
      taxistaAsignado: json['taxistaAsignado'],
      estado: json['estado']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "usuario": usuario,
        "calle_principal": callePrincipal,
        "calle_secundaria": calleSecundaria,
        "referencia": referencia,
        "barrio_sector": barrioSector,
        "informacion_adicional": informacionAdicional,
        "taxista_asignado": taxistaAsignado,
        "estado": estado,
      };
}
