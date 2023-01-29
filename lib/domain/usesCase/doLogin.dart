import 'package:dartz/dartz.dart';
import 'package:reserva_movil/core/errors/failure.dart';
import 'package:reserva_movil/domain/entities/user.dart';
import 'package:reserva_movil/domain/repositories/authRepository.dart';

class DoLogin{
  final AuthRepository authRepository;

  DoLogin(this.authRepository);

  Future<Either<Failure, UserEntiti>> call({ required int repository, String? phoneNumber }) async{
    return authRepository.login(phoneNumber: phoneNumber,repository: repository);
  }
}