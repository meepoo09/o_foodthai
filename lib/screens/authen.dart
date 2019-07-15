import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
//  Explicit

// medthod
  Widget showLogo() {
    return Container(
        width: 160.0, height: 160.0, child: Image.asset('images/logo.png'));
  }

  Widget showAppName() {
    return Text(
      'Fodddd',
      style: TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.bold,color: Colors.orange[200],
        fontFamily: 'Prompt',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[showLogo(), showAppName()],
        ),
      ),
    );
  }
}
