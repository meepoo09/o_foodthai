import 'package:flutter/material.dart';
import 'package:o_foodthai/models/user_model.dart';
import 'package:o_foodthai/screens/register.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

import 'my_service.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
//  Explicit
  final formKey = GlobalKey<FormState>();
  String user, password;
// medthod
  Widget signInButton() {
    return RaisedButton(
      color: Colors.orange[300],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          autentication();
        }
      },
    );
  }

  Future<void> autentication() async {
    String urlString =
        'https://www.androidthai.in.th/ooo/getUserWhereUserO.php?isAdd=true&User=$user';
    var response = await get(urlString);
    var result = json.decode(response.body);

    if (result.toString() == 'null') {
      print('User False');
      myAlertDialog('User False', 'No $user in my Systems');
    } else {
      print('User true $result');
      for (var myParseJson in result) {
        UserModel userModel = UserModel.parseJson(myParseJson);
        String truePassword = userModel.pass;
        if (password == truePassword) {
          var myServiceRoute =
              MaterialPageRoute(builder: (BuildContext context) => MyService(userModel: userModel,));
          Navigator.of(context).pushAndRemoveUntil(
              myServiceRoute, (Route<dynamic> route) => false);
        } else {
          myAlertDialog('PassWord False', 'Plesase Try Agains Password false');
        }
      }
    }
  }

  void myAlertDialog(String titleString, String messageString) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            titleString,
            style: TextStyle(color: Colors.red[300]),
          ),
          content: Text(messageString),
          actions: <Widget>[alertButton()],
        );
      },
    );
  }

  Widget alertButton() {
    return FlatButton(
      child: Text('OK'),
      onPressed: () {
        Navigator.of(context).pop();
      },
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
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Type User !';
          }
        },
        onSaved: (String value) {
          user = value;
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password :',
          labelStyle: TextStyle(color: Colors.orangeAccent),
          hintText: 'Not Blank',
        ),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please Type pass !';
          }
        },
        onSaved: (String value) {
          password = value;
        },
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
        child: Form(
            key: formKey,
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
            )),
      ),
    );
  }
}
