//import 'dart:convert';
//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sani_app/theme/theme_constants.dart';
import 'package:sani_app/theme/theme_manager.dart';

//Colors (5 hoch v. normal)
const crayolaBlue = Color(0xff1b2f33);
const platinumWhite = Color(0xffebebeb);
const burgundy = Color(0xffE21239);
const gunmetal = Color(0xff3f6f78);
//const smokyBlack = Color(0xFF121212);
const jet = Color(0xFF303030);

void main() {
  runApp(const SaniApp());
}

ThemeManager _themeManager = ThemeManager();

class SaniApp extends StatefulWidget {
  const SaniApp({super.key});

  @override
  State<SaniApp> createState() => _SaniAppState();
}

class _SaniAppState extends State<SaniApp> {
  @override
  void initState() {
    super.initState();
    _themeManager.addListener((themeListener));
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    _themeManager.removeListener((themeListener));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saniapp',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: Scaffold(
          appBar: AppBar(
            //App Bar
            actions: [
              Switch(
                  value: _themeManager.themeMode == ThemeMode.dark,
                  onChanged: (newValue) {
                    _themeManager.toggleTheme(newValue);
                  })
            ],
            //backgroundColor: Colors.white,
            elevation: 0.5, //Line under app bar
            title: const Text(
              'Schulsanitöter Organisationsapp', //Text displayed in app bar
            ),
          ),
          body: Container(
              //color: Colors.white,
              // alignment: Alignment.topCenter,
              child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //top button
                    margin: const EdgeInsets.only(top: 60),
                    padding: const EdgeInsets.all(25), //TODO different solution
                    width: 640,
                    height: 80,
                    decoration: BoxDecoration(
                        color: burgundy,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                              offset: Offset(6.0, 6.0))
                        ]),
                    child: const Text(
                      'NEUES EINSATZPROTOKOLL',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: platinumWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //lower left button
                    margin: const EdgeInsets.only(top: 40, right: 20),
                    padding: const EdgeInsets.all(20),
                    width: 300,
                    height: 450,
                    decoration: BoxDecoration(
                        color: gunmetal,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                              offset: Offset(6.0, 6.0))
                        ]),

                    // color: Color(0xff1b2f33),
                    child: const Text(
                      'Protokollarchiv',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: platinumWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    //lower right button
                    margin: const EdgeInsets.only(top: 40, left: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: gunmetal,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                              offset: Offset(6.0, 6.0))
                        ]),
                    width: 300,
                    height: 450,
                    //color: Color(0xff1b2f33),
                    child: const Text(
                      'Schichtplan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: platinumWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ))),
    );
  }
}
