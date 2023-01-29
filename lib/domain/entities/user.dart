

import 'dart:convert';

import 'package:equatable/equatable.dart';


class UserEntiti extends Equatable{
    UserEntiti({
        required this.tipoUsuario,
        required this.nombres,
        required this.correoElectronico,
        required this.celular
    });

    final String tipoUsuario;
    final String nombres;
    final String correoElectronico;
    final String celular;
    
      @override
      List<Object?> get props => [
        tipoUsuario,
        nombres,
        correoElectronico,
        celular,
      ];


}
