part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginIsLoadingPhone extends LoginState {

  @override
  List<Object> get props => [];
}
class LoginIsLoadingGoogle extends LoginState {

  @override
  List<Object> get props => [];
}

class LoginShowInputPhone extends LoginState {

  @override
  List<Object> get props => [];
}

class LoginLoaded extends LoginState {
  final UserEntiti user;

  LoginLoaded(this.user);

  @override
  List<Object> get props => [user];

  
}

class LoginIsOutLoaded extends LoginState {
  final bool out;

  LoginIsOutLoaded(this.out);

  @override
  List<Object> get props => [out];

  
}

class LoginError extends LoginState {
  final String messageErr;

  LoginError(this.messageErr);

  @override
  List<Object> get props => [messageErr];
}