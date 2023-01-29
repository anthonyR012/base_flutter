import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reserva_movil/config/environment.dart';
import 'package:reserva_movil/data/datasources/authDatasource.dart';
import 'package:reserva_movil/data/implementation/authImplement.dart';
import 'package:reserva_movil/domain/repositories/authRepository.dart';
import 'package:reserva_movil/domain/usesCase/doLogin.dart';
import 'package:reserva_movil/ui/login/login_cubit.dart';

Future<void> init() async {
  // Petition to the project per Dio
  Environment.sl.registerLazySingleton(() => Dio());
  //google sing dependencies
  Environment.sl.registerLazySingleton(() => GoogleSignIn());
  // firebase instance
  Environment.sl.registerLazySingleton(() => FirebaseAuth.instance);

  Environment.sl.registerFactory<AuthDatasource>(
      () => AuthDatasourceImplement(Environment.sl(), Environment.sl()));
  Environment.sl.registerFactory<AuthRepository>(() => AuthImplement(Environment.sl<AuthDatasource>()));

  Environment.sl.registerFactory(() => DoLogin(Environment.sl()));

  Environment.sl.registerFactory(() => LoginCubit(Environment.sl()));
}
