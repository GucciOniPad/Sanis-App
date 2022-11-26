import 'package:flutter/material.dart';
import 'package:sani_app/main.dart';

ThemeData lightTheme = ThemeData(
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: crayolaBlue,
          fontWeight: FontWeight.bold,
          fontSize: 35,
        )));

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
        backgroundColor: jet,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 35,
        )));
