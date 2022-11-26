//import 'dart:convert';
//import 'dart:html';
//import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sani_app/theme/theme_constants.dart';
import 'package:sani_app/theme/theme_manager.dart';

//Colors (5 hoch v. normal)
const crayolaBlue = Color(0xff1b2f33);
const platinumWhite = Color(0xffebebeb);
const burgundy = Color(0xffE21239);
const gunmetal = Color(0xff3f6f78);
//const smokyBlack = Color(0xFF121212); <- evtl. andere Fabre für Darkmode
const jet = Color(0xFF303030); //aktuelle Darkmode Farbe

void main() {
  runApp(const SaniApp());
}

ThemeManager _themeManager = ThemeManager();

class SaniApp extends StatefulWidget {
  const SaniApp({super.key});

  @override
  State<SaniApp> createState() => _SaniAppState();
} //creation of stateful widget

class _SaniAppState extends State<SaniApp> {
  @override
  void initState() {
    super.initState();
    _themeManager.addListener((themeListener));
  } //Function to change state and add the theme listener

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  } //theme listener

  @override
  void dispose() {
    super.dispose();
    _themeManager.removeListener((themeListener));
  } //dispose theme listener

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Saniapp',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: Scaffold(
        appBar: AppBar(
          //App Bar
          //centerTitle: true,
          actions: [
            Switch(
                value: _themeManager.themeMode == ThemeMode.dark,
                onChanged: (newValue) {
                  _themeManager.toggleTheme(newValue);
                })
          ],
          leading: IconButton(
            //padding: EdgeInsets.only(bottom: 19),
            //alignment: Alignment.topCenter,
            icon: Image.asset('assets/darksplash.png'),
            onPressed: () => exit(0),
            tooltip: 'quit apllication',
          ),
          elevation: 0.5, //Line under app bar
          title: Text(
            'Schulsanitöter Organisationsapp',
          ), //Text displayed in app bar
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    //top button
                    margin: const EdgeInsets.only(top: 120),
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
                      ],
                    ),
                    child: const Text(
                      'NEUES EINSATZPROTOKOLL',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: platinumWhite,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
                    height: 300,
                    decoration: BoxDecoration(
                      color: gunmetal,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                            offset: Offset(6.0, 6.0))
                      ],
                    ),
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
                      ],
                    ),
                    width: 300,
                    height: 300,
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
          ),
        ),
      ),
    );
  }
}

//einsatzprotokoll page
class einsatzprotokollPage extends StatelessWidget {
  const einsatzprotokollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Einsatzprotokoll Page',
      home: Scaffold(
        appBar: AppBar(
          //App Bar
          actions: [
            Switch(
              value: _themeManager.themeMode == ThemeMode.dark,
              onChanged: (newValue) {
                _themeManager.toggleTheme(newValue);
              },
            )
          ],
          //backgroundColor: Colors.white,
          elevation: 0.5, //Line under app bar
          title: const Text(
            'Schulsanitöter Organisationsapp', //Text displayed in app bar
          ),
        ),
      ),
    );
  }
}
