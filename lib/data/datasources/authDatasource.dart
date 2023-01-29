import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reserva_movil/config/constant.dart';
import 'package:reserva_movil/core/errors/exception.dart';
import 'package:reserva_movil/domain/entities/user.dart';

abstract class AuthDatasource {
  Future<bool> logoutGoogle();
  Future<UserEntiti> loginWithGoogle();
  Future<UserEntiti> loginWithPhone({required String phoneNumber});
}

class AuthDatasourceImplement extends AuthDatasource {
  FirebaseAuth _auth;
  GoogleSignIn _googleSingIn;

  AuthDatasourceImplement(this._auth, this._googleSingIn);

  @override
  Future<UserEntiti> loginWithGoogle() async {
    final googleSignInAccount = await _googleSingIn.signIn();
    if (googleSignInAccount == null) {
      throw PlatformError();
    }
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    // Getting users credential
    UserCredential result = await _auth.signInWithCredential(authCredential);
    if (result.user == null) throw EmptyError();

    User user = result.user!;
    UserEntiti userEntiti = UserEntiti(
        tipoUsuario: USUARIO_COMUN,
        nombres: user.displayName.toString(),
        correoElectronico: user.email.toString(),
        celular: user.phoneNumber ?? "");
    return userEntiti;
  }

  @override
  Future<UserEntiti> loginWithPhone({required String phoneNumber}) {
    try {
      _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException exception) {},
          codeSent: (String verificationID, int? resedToken) {},
          codeAutoRetrievalTimeout: (String verificationId) {});
    } catch (e) {
      print(e);
    }

    throw PlatformError();
  }

  @override
  Future<bool> logoutGoogle() async {
    if (await _googleSingIn.isSignedIn()) {
      await _auth.signOut();
      await _googleSingIn.signOut();
      return true;
    } else {
      throw PlatformError();
    }
  }
}
