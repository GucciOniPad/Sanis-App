import 'package:flutter/material.dart';
import 'package:sani_app/main.dart';

//Das sind die beiden Theme Settings

ThemeData lightTheme = ThemeData(
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        foregroundColor: jet,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: jet,
        ),
        titleTextStyle: TextStyle(
          color: crayolaBlue,
          fontWeight: FontWeight.bold,
          fontSize: 35,
        )));

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: jet,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 35,
        )));
