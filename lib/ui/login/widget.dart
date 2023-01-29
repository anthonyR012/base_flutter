 

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reserva_movil/config/constant.dart';
import 'package:reserva_movil/config/theme.dart';

class WidgetsLogin{

  Widget getBigButton(
      {required BuildContext context,
      required String text,
      required double size,
      required String pathImage,
      required double padding}) {
    return Container(
      width: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Theme.of(context).primaryColor, Theme.of(context).shadowColor])),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: ListTile(
          leading: Image.asset(pathImage),
          title: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

    Widget getButtonCustom(
      {required BuildContext context,
      required String text,
      required Size size,
      required IconData icon,
      required double padding}) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Theme.of(context).primaryColor, Theme.of(context).shadowColor])),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: ListTile(
          leading:Icon(icon),
          title: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  //MESSAGE ERROR
  Widget getMessageError(
      {required BuildContext context, required bool visible, String? msgErr}) {
      
    var splitag = msgErr?.split(",") ?? [""];
    String message = "";
    splitag.forEach((element) {
      
      message = message + element + "\n";
    });

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Visibility(
        child: Container(
          child: ListTile(
            iconColor: Colors.red,
            trailing:  Icon(Icons.error),
            title:  Text(
                message,
                style: Theme.of(context).textTheme.caption?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context)
                        .inputDecorationTheme
                        .labelStyle!
                        .color),
            ),
          ),
        ),
        visible: visible,
      ),
    );
  }
  
  Widget getMainLabel(context, String text, TextAlign aling) {
    return Text(
      text,
      textAlign: aling,
      style: Theme.of(context).textTheme.caption?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).inputDecorationTheme.labelStyle?.color),
    );
  }

  Widget getMainTextField(context, String text, IconData icon,
      TextEditingController controller, TextInputType type, bool obscure) {
    return StreamBuilder(builder: (context, snapshot) {
      return TextFormField(
        validator: (value) => value!.isEmpty
            ? "Campo requerido"
            : value.length < 2
                ? "Necesita minimo 2 caracteres "
                : null,
        controller: controller,
        keyboardType: type,
        autofocus: false,
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Theme.of(context).iconTheme.color),
          hintText: text,
        ),
      );
    });
  }


}