// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:reserva_movil/domain/entities/user.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends UserEntiti{
    UserModel({
        required this.tipoUsuario,
        required this.nombres,
        required this.correoElectronico,
        required this.celular,
    }) : super(
      tipoUsuario:tipoUsuario,
      nombres:nombres,
      correoElectronico:correoElectronico,
      celular:celular,
    );

    final String tipoUsuario;
    final String nombres;
    final String correoElectronico;
    final String celular;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        tipoUsuario: json["tipo_usuario"],
        nombres: json["nombres"],
        correoElectronico: json["correo_electronico"],
        celular: json["celular"],
    );

    Map<String, dynamic> toJson() => {
        "tipo_usuario": tipoUsuario,
        "nombres": nombres,
        "correo_electronico": correoElectronico,
        "celular": celular,
    };
}
