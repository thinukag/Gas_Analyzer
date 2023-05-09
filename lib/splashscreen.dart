import 'dart:async';

import 'package:flutter/material.dart';

//import 'Login/Dealer/dealer_sign_in.dart';
import 'mainmenu.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  //waiting duration of the spalsh screen
  startTimer() async {
    var duration = Duration(seconds: 5);
    return new Timer(duration, route);
  }

  //navigate to the main page after 5 seconds
  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MainMenu()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            //bg image
            Image(
              image: AssetImage("assets/Background.png"),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            //lpg logo
            Align(
              alignment: Alignment.center,
              child: Image.asset("assets/Logo.png", height: 200, width: 200),
            ),
          ],
        ));
  }
}
