import 'package:flutter/material.dart';
import 'package:sani_app/main.dart';

//Das sind die beiden Theme Settings

ThemeData lightTheme = ThemeData(
    //fontFamily: 'Din-Condensed',
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        foregroundColor: jet,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: jet,
        ),
        titleTextStyle: TextStyle(
          //fontFamily: 'Din-Condensed',
          color: crayolaBlue,
          fontWeight: FontWeight.bold,
          fontSize: 35,
        )));

ThemeData darkTheme = ThemeData(
    //fontFamily: 'Din-Condensed',
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: jet,
        titleTextStyle: TextStyle(
          //fontFamily: 'Din-Condensed',
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 35,
        )));
