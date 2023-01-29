import 'package:dartz/dartz.dart';
import 'package:reserva_movil/config/constant.dart';
import 'package:reserva_movil/core/errors/exception.dart';
import 'package:reserva_movil/core/errors/failure.dart';
import 'package:reserva_movil/data/datasources/authDatasource.dart';
import 'package:reserva_movil/domain/entities/user.dart';
import 'package:reserva_movil/domain/repositories/authRepository.dart';



class AuthImplement extends AuthRepository {
  final AuthDatasource authDatasource;

  AuthImplement(this.authDatasource);

  @override
  Future<Either<Failure, UserEntiti>> login({ required int repository, String? phoneNumber }) async{
    try {
      var user;
      switch (repository) {
          case REPOSITORY_GMAIL:
          user = await this.authDatasource.loginWithGoogle();
          break;
          case REPOSITORY_PHONE:
          user = await this.authDatasource.loginWithPhone(phoneNumber: phoneNumber!);
          break;
      }
      return Right(user);
    } on PlatformError {
      return Left(
        FailureMessage(message: "Cancelled login")
      );
    } on EmptyError {
      return Left(
        FailureMessage(message: "No found user")
      );
    }
  }
  
  @override
  Future<Either<Failure, bool>> logout() async{
    try {
      final isOut = await this.authDatasource.logoutGoogle();
      return Right(isOut);
    } on PlatformError {
      return Left(
        FailureMessage(message: "Is no sing up actually")
      );
    } 
  }
}
