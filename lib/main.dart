import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const crayolaBlue = Color(0xff1b2f33);
const platinumWhite = Color(0xffebebeb);
const burgundy = Color(0xff841b21);
const gunmetal = Color(0xff2a2f3c);
void main() {
  runApp(const SaniApp());
}

class SaniApp extends StatelessWidget {
  const SaniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saniapp',
      home: Scaffold(
          appBar: AppBar(
            //App Bar
            shadowColor: Colors.white,
            backgroundColor: Colors.white,
            elevation: 0.0,
            title: const Text(
              'Saniapp',
              style: TextStyle(
                color: crayolaBlue,
                fontSize: 35,
              ),
            ),
          ),
          body: Container(
              color: Colors.white,
              // alignment: Alignment.topCenter,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //top button
                        margin: const EdgeInsets.only(top: 60),
                        padding:
                            const EdgeInsets.all(25), //TODO different solution
                        width: 800,
                        height: 80,
                        decoration: BoxDecoration(
                            color: burgundy,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  offset: Offset(12.0, 12.0))
                            ]),
                        child: const Text(
                          'NEUES EINSATZPROTOKOLL',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: platinumWhite),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        //lower left button
                        margin: const EdgeInsets.only(top: 40),
                        padding: const EdgeInsets.all(20),
                        width: 300,
                        height: 450,
                        decoration: BoxDecoration(
                            color: gunmetal,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  offset: Offset(12.0, 12.0))
                            ]),

                        // color: Color(0xff1b2f33),
                        child: const Text(
                          'Protokollarchiv',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: platinumWhite),
                        ),
                      ),
                      Container(
                        //lower right button
                        margin: const EdgeInsets.only(top: 40),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: gunmetal,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  offset: Offset(12.0, 12.0))
                            ]),
                        width: 300,
                        height: 450,
                        //color: Color(0xff1b2f33),
                        child: const Text(
                          'Schichtplan',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 20, color: platinumWhite),
                        ),
                      ),
                    ],
                  )
                ],
              ))),
    );
  }
}
