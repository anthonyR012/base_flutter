import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reserva_movil/config/constant.dart';
import 'package:reserva_movil/config/environment.dart';
import 'package:reserva_movil/data/datasources/authDatasource.dart';
import 'package:reserva_movil/domain/entities/user.dart';
import 'package:reserva_movil/ui/login/login_cubit.dart';
import 'package:reserva_movil/ui/login/widget.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  static const TAG = "/login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final widgetGestor = WidgetsLogin();
  late ThemeData _theme;
  late BuildContext _readContext;
  late Size _size;
  TextEditingController _phoneNumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    _size = MediaQuery.of(context).size;
    return getHomeLogin(context, false);
  }

  //WIDGET HOME LOGIN INITIAL
  Widget getHomeLogin(BuildContext context, bool visible, {String? msgErr}) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 70,
                      left: 0,
                      right: 0,
                      height: _size.width,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: const [
                                  0.8,
                                  1.0
                                ],
                                colors: [
                                  _theme.primaryColor,
                                  _theme.shadowColor
                                ]),
                            color: Colors.red,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(_size.width / 2))),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                            backgroundColor: _theme.canvasColor,
                            radius: 100,
                            child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Image.asset(
                                    GESTOR_IMAGES_BASE + 'logomobile.png')))),
                  ],
                )),
            Expanded(
              flex: 3,
              child: BlocProvider(
                create: (context) => Environment.sl<LoginCubit>(),
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    _readContext = context;
                    print(state);
                    if (state is LoginInitial) {
                      return Column(
                          children: [_buttonGoogle(), _buttonPhone()]);
                    } else if (state is LoginShowInputPhone) {
                      return Column(
                        children: _inputTextEnterPhone(),
                      );
                    } else if (state is LoginIsLoadingPhone) {
                      return Column(children: [
                        _buttonGoogle(),
                        CircularProgressIndicator()
                      ]);
                    }else if(state is LoginLoaded){
                      
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: widgetGestor.getMessageError(
                  context: context, visible: visible, msgErr: msgErr),
            )
          ],
        ),
      ),
    );
  }

  _buttonGoogle() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 15),
      child: InkWell(
          onTap: () => login(REPOSITORY_GMAIL, context),
          child: widgetGestor.getBigButton(
              context: context,
              text: 'Continuar con Google',
              pathImage: GESTOR_IMAGES_BASE + 'icongoogle.png',
              size: _size.width,
              padding: 3.0)),
    );
  }

  _buttonPhone() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 15),
      child: InkWell(
          onTap: () => login(REPOSITORY_PHONE, context),
          child: widgetGestor.getBigButton(
              context: context,
              text: 'Continuar con el telefono',
              pathImage: GESTOR_IMAGES_BASE + 'icontelefono.png',
              size: _size.width,
              padding: 3.0)),
    );
  }

  List<Widget> _inputTextEnterPhone() {
    return [
      _buttonGoogle(),
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            widgetGestor.getMainLabel(
                _readContext, "Ingrese numero telefonico", TextAlign.start),
            widgetGestor.getMainTextField(
                _readContext,
                "Numero",
                Icons.settings_cell_sharp,
                _phoneNumber,
                TextInputType.number,
                false),
            widgetGestor.getButtonCustom(
                context: context,
                text: "Aceptar",
                size: _size,
                icon: Icons.switch_access_shortcut_add_sharp,
                padding: 25)
          ],
        ),
      ),
    ];
  }

  void login(int repository, BuildContext context) async {
    try {
      if (repository != REPOSITORY_PHONE) {
        _readContext.read<LoginCubit>().doLogin(repository: repository);
      } else {
        _readContext.read<LoginCubit>().enterPhone();
      }
    } catch (e) {
      print(e);
    }
  }
}
