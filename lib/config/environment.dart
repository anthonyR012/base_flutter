import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:reserva_movil/firebase_options.dart';
import 'package:reserva_movil/dependencyInjector/dp.dart' as dpInyector;
class Environment {
  static GetIt sl = GetIt.instance;

  static initEnviroment() async {
    sl.allowReassignment = true; 
    //initialize app firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await dpInyector.init();

  }

}
