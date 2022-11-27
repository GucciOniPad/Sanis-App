//import 'dart:convert';
//import 'dart:html';
//import 'package:flutter/foundation.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sani_app/neuesProtokoll.dart';
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
                  //  Padding(padding: EdgeInsets.only(top: 180)),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                            offset: Offset(6.0, 6.0))
                      ],
                    ),
                    margin: const EdgeInsets.only(top: 120),
                    //  padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: 640,
                      height: 80,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                          enableFeedback: false,
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(burgundy),
                        ),
                        onPressed: () {
                          print("Neues Einsatzprotokoll");
                        },
                        child: Text(
                          'NEUES EINSATZPROTOKOLL',
                          style: TextStyle(
                              fontSize: 20,
                              color: platinumWhite,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                            offset: Offset(6.0, 6.0))
                      ],
                    ),
                    margin: const EdgeInsets.only(top: 40, right: 20),
                    // padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                          enableFeedback: false,
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(gunmetal),
                        ),
                        onPressed: () {
                          print("Protokollarchiv");
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 20, bottom: 35),
                              child: Text(
                                'Protokollarchiv',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: platinumWhite,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                'Im Protokollarchiv hast du Zugriff auf vergangene Einsatzprotokolle.',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: platinumWhite,
                                  height: 1.4,
                                  //    fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                            offset: Offset(6.0, 6.0))
                      ],
                    ),
                    margin: const EdgeInsets.only(top: 40, left: 20),
                    //    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          splashFactory: NoSplash.splashFactory,
                          enableFeedback: false,
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(gunmetal),
                        ),
                        onPressed: () {
                          print('Schichtplan');
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 20, bottom: 35),
                              child: Text(
                                'Schichtplan',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: platinumWhite,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                'Im Schichtplan siehst du, wer an welchen Tagen in welchen Schulstunden Bereitschaft hat.',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: platinumWhite,
                                  height: 1.4,
                                  //    fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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

/*
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
m*/