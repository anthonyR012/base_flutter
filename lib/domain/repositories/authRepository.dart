import 'package:dartz/dartz.dart';
import 'package:reserva_movil/core/errors/failure.dart';
import 'package:reserva_movil/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, UserEntiti>> login({ required int repository, String? phoneNumber });

}