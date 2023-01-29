import 'package:flutter/material.dart';
import 'package:reserva_movil/ui/login/login.dart';
import 'package:reserva_movil/ui/splash.dart';

final router = {
  Splash.TAG: (context) => Splash(),
  Login.TAG: (context) => Login(),
};

onGenerateRouteAnimated(settings) {
  
  switch (settings.name) {
    case Login.TAG:
      return pageRouterAnimatedUp(Login());
    default:
      return pageRouterAnimatedUp(Splash());
  }

}

PageRouteBuilder pageRouterAnimatedUp(Widget child) {


  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
