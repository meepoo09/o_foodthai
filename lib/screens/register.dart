import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  //Method

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.face,
            size: 36.0,
            color: Colors.orange[300],
          ),
          labelText: 'Name :',
          labelStyle: TextStyle(color: Colors.orange[300]),
          helperText: 'Type Display Name',
          helperStyle: TextStyle(color: Colors.black26,
          fontStyle: FontStyle.italic)),
    );
  }
 Widget userText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.account_circle,
            size: 36.0,
            color: Colors.orange[300],
          ),
          labelText: 'User :',
          labelStyle: TextStyle(color: Colors.orange[300]),
          helperText: 'Type UserName',
          helperStyle: TextStyle(color: Colors.black26,
          fontStyle: FontStyle.italic)),
    );
  }
   Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: Colors.orange[300],
          ),
          labelText: 'Password :',
          labelStyle: TextStyle(color: Colors.orange[300]),
          helperText: 'Type Password',
          helperStyle: TextStyle(color: Colors.black26,
          fontStyle: FontStyle.italic)),
    );
  }
  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('ลงทะเบียน'),
        actions: <Widget>[
          uploadButton(),
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
        child: ListView(
          children: <Widget>[
            nameText(),
            userText(),
            passwordText(),
          ],
        ),
      ),
    );
  }
}
