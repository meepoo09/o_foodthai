import 'package:flutter/material.dart';
import 'package:o_foodthai/screens/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
//  Explicit

// medthod
  Widget signInButton() {
    return RaisedButton(
      color: Colors.orange[300],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget signUpButton() {
    return OutlineButton(
      color: Colors.blue[300],
      child: Text(
        'Sign Up',
        style: TextStyle(color: Colors.orange[300]),
      ),
      onPressed: () {
        print('you Click Sign Up');
        var regRoute =
            MaterialPageRoute(builder: (BuildContext context) => Register());
            Navigator.of(context).push(regRoute);
      },
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: signInButton(),
          ),
          mySizeBox(),
          Expanded(
            child: signUpButton(),
          ),
        ],
      ),
    );
  }

  Widget userText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'User :',
          labelStyle: TextStyle(color: Colors.orangeAccent),
          hintText: 'Not Blank',
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Password :',
          labelStyle: TextStyle(color: Colors.orangeAccent),
          hintText: 'Not Blank',
        ),
      ),
    );
  }

  Widget mySizeBox() {
    return SizedBox(
      height: 16.0,
      width: 8.0,
    );
  }

  Widget showLogo() {
    return Container(
        width: 160.0, height: 160.0, child: Image.asset('images/logo.png'));
  }

  Widget showAppName() {
    return Text(
      'โอเบค',
      style: TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
        color: Colors.orange[200],
        fontFamily: 'Prompt',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.teal[100]],
            begin: Alignment.topCenter,
          ),
        ),
        padding: EdgeInsets.only(top: 50.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showLogo(),
            mySizeBox(),
            showAppName(),
            userText(),
            passwordText(),
            mySizeBox(),
            showButton(),
          ],
        ),
      ),
    );
  }
}
