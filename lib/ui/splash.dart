import 'package:flutter/material.dart';
import 'package:reserva_movil/config/constant.dart';
import 'package:reserva_movil/config/environment.dart';
import 'package:reserva_movil/config/theme.dart';
import 'package:reserva_movil/ui/login/login.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);
  static const TAG = "/splash";
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late ThemeData _theme;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _loadLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);

    return Scaffold(
        body: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            image: AssetImage('${GESTOR_IMAGES_BASE}logorojo.png'),
          ),
        ],
      ),
    ));
  }

  void _loadLogin() async {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Login.TAG);
    });
  }
}
