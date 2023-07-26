import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stree/getstarted.dart';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => GettingStartedScreen())));

    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: ListView(
            children: [
              Image.asset(
                'assets/images/appnameonly.png',
                scale: 1.5,
                color: Colors.red[200],
                width: 200.0,
                height: 600.0,
                fit: BoxFit.scaleDown,
              ),
              //Padding(padding: EdgeInsets.all(50)),
              SpinKitDoubleBounce(color: Colors.red[300], size: 40.0),
            ],
          ),
        ),
      ),
    );
  }
}
