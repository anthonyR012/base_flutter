
import 'package:flutter/material.dart';
import 'package:reserva_movil/config/constant.dart';
import 'package:reserva_movil/config/environment.dart';
import 'package:reserva_movil/config/router.dart';
import 'package:reserva_movil/config/theme.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Environment.initEnviroment();
  
  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     
    return MaterialApp(
      theme: ligthTheme,
      onGenerateRoute: (settings) =>  onGenerateRouteAnimated(settings),
      debugShowCheckedModeBanner: true,
      title: NAME_PROJECT,
      
      );
  }
}