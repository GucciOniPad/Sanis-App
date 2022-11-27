import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sani_app/theme/theme_constants.dart';
import 'package:sani_app/theme/theme_manager.dart';

//Colors (5 hoch v. normal)
const crayolaBlue = Color(0xff1b2f33);
const platinumWhite = Color(0xffebebeb);
const burgundy = Color(0xffE21239);
const gunmetal = Color(0xff3f6f78);
//const smokyBlack = Color(0xFF121212); <- evtl. andere Fabre für Darkmode
const jet = Color(0xFF303030); //aktuelle Darkmode Farbe

ThemeManager _themeManager = ThemeManager();

class neuesProtokoll extends StatefulWidget {
  const neuesProtokoll({super.key});

  @override
  State<neuesProtokoll> createState() => _neuesProtokollState();
}

class _neuesProtokollState extends State<neuesProtokoll> {
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
            onPressed: () {
              Navigator.pop(context);
            },
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
                          print("NEUES EINSATZPROTOKOLL");
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
            ],
          ),
        ),
      ),
    );
  }
}
