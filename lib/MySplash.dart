import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app/Home.dart';

import 'package:splashscreen/splashscreen.dart';

class MySplash extends StatefulWidget {
  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 3,
      navigateAfterSeconds: Home(),
      title: new Text("WD",
          style: new TextStyle(
              color: Color(0xFF42A5F5),
              fontWeight: FontWeight.bold,
              fontSize: 30)),
      image: Image.asset("assets/wdlogo.png"),
      backgroundColor: Color(0xFF000000),
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 200,
      loaderColor: Color(0xFF42A5F5),
    );
  }
}
