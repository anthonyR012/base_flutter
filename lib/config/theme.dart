
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
class GestorColor{
  // Color ligth theme
  static const primaryColor = Color(0xFF7816a9);
  static const secondaryColor = Color(0xFF6258b2);
  static const threeColor = Color(0xFF2b17da);
  static const fourthColor = Color(0xFFf8f8f8);
  static const textColor = Color(0xFF2800e6);

  //color dark theme
  static const primaryColorDark = Color(0xFF2b17da);
  static const secondaryColorDark = Color(0xFF6258b2);
  static const threeColorDark = Color(0xFFffffff);
  static const fourthColorDark = Color(0xFFf8f8f8);
  static const fifthColorDark = Color(0xFFFFFFFF);

  static const staticColor = Color.fromARGB(255, 1, 0, 0);

  //color header accordion

  static const headerStyle = TextStyle(
        color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  static const contentStyleHeader = TextStyle(
        color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
        color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);

  static final borderLigth = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: GestorColor.fourthColor,
        width: 1,
        style: BorderStyle.solid,
    )
  );

  static final borderDark = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: GestorColor.fifthColorDark,
        width: 1,
        style: BorderStyle.solid,
    )
  );


}


// Theme ligth
/**
 * Adaptive color dark when the person cliked of button
 * @Default
 */
final ligthTheme = ThemeData(

  canvasColor: Colors.grey[100],
  appBarTheme: const AppBarTheme(
    color: GestorColor.primaryColor, 
    
  ),
  
  primaryColor: GestorColor.primaryColor,
  shadowColor: GestorColor.secondaryColor,
  scaffoldBackgroundColor: GestorColor.fourthColor,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: GestorColor.textColor,
    displayColor: GestorColor.primaryColor
  ),
floatingActionButtonTheme: const  FloatingActionButtonThemeData(
  backgroundColor: GestorColor.threeColor,
  
),

  bottomAppBarColor: GestorColor.primaryColor,
  cardColor: GestorColor.fourthColor,
  inputDecorationTheme: InputDecorationTheme(
    border:GestorColor.borderLigth,
    enabledBorder: GestorColor.borderLigth,
    focusedBorder: GestorColor.borderLigth,
    contentPadding: EdgeInsets.zero,
    labelStyle: TextStyle(color: GestorColor.textColor),
    filled: true,
    hintStyle: GoogleFonts.poppins(
      color: GestorColor.secondaryColor,
      fontSize: 12,
    )
    ),

    iconTheme: const IconThemeData(
      color: GestorColor.primaryColor
    )
);



// Theme dark
/**
 * Adaptive color ligth when the person cliked of button
 */

final dartTheme = ThemeData(
    appBarTheme: const AppBarTheme(
    color: GestorColor.threeColorDark, 
  ),
  bottomAppBarColor: Colors.transparent,
  canvasColor: GestorColor.threeColorDark,
  
  primaryColor: GestorColor.primaryColorDark,
  shadowColor: GestorColor.secondaryColorDark,

  cardColor: Colors.grey[800],
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
  backgroundColor: GestorColor.threeColorDark,
  ),  

  scaffoldBackgroundColor: GestorColor.primaryColor,
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: GestorColor.staticColor,
    displayColor: GestorColor.primaryColorDark
  ),

  inputDecorationTheme: InputDecorationTheme(
    border: GestorColor.borderDark,
    enabledBorder: GestorColor.borderDark,
    focusedBorder: GestorColor.borderDark,
    contentPadding: EdgeInsets.zero,
    labelStyle: TextStyle(color: GestorColor.fifthColorDark),
    fillColor: GestorColor.threeColorDark,
    filled: true,
    hintStyle: GoogleFonts.poppins(
      color: GestorColor.staticColor,
      fontSize: 12,
    )
    ),

    iconTheme: const IconThemeData(
      color: GestorColor.secondaryColorDark
    )
);