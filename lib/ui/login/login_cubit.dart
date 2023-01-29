import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:reserva_movil/config/constant.dart';
import 'package:reserva_movil/core/errors/failure.dart';
import 'package:reserva_movil/domain/entities/user.dart';
import 'package:reserva_movil/domain/usesCase/doLogin.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final DoLogin login;
  LoginCubit(this.login) : super(LoginInitial());

  void doLogin({ required int repository, String? phoneNumber }) async {
    emit(LoginIsLoadingGoogle()); 
    final failureOrUser = await login(phoneNumber:phoneNumber,repository: repository);
    emit(_failureOrUser(failureOrUser));
  
  }

  void doLogout() async {
    emit(LoginIsLoadingGoogle());
    final failureOrBool = false;
    //emit(failureOrBool);
   
  }

  void enterPhone() async{
    emit(LoginIsLoadingPhone());
    await Future.delayed(Duration(seconds: 1));
    emit(LoginShowInputPhone());
  }

  LoginState _failureOrBool(Either<Failure, bool> failureOrBool) {
    return failureOrBool.fold(
        (failure) => LoginError(failure.message), (out) => LoginIsOutLoaded(out));
  }

  LoginState _failureOrUser(Either<Failure, UserEntiti> failureOrUser) {
    return failureOrUser.fold(
        (failure) => LoginError(failure.message), (user) => LoginLoaded(user));
  }
}
