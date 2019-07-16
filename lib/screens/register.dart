import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  //Method
  final formkey = GlobalKey<FormState>();
  String name, user, password;
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
        helperStyle:
            TextStyle(color: Colors.black26, fontStyle: FontStyle.italic),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Name In Blank';
        }
      },
      onSaved: (String value) {
        name = value;
      },
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
        helperStyle:
            TextStyle(color: Colors.black26, fontStyle: FontStyle.italic),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Name In Blank';
        }
      },
      onSaved: (String value) {
        user = value;
      },
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
        helperStyle:
            TextStyle(color: Colors.black26, fontStyle: FontStyle.italic),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Name In Blank';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('Click Upload');
        if (formkey.currentState.validate()) {
          formkey.currentState.save();
          print('name=$name, user = $user, password=$password');
          registerToServer();
        }
      },
    );
  }

  Future<void> registerToServer() async {
    String url =
        'https://www.androidthai.in.th/ooo/addDataO.php?isAdd=true&Name=$name&User=$user&Password=$password';
    var response = await get(url);
    var result = json.decode(response.body);
    print('result = $result');
    if ((result.toString())=='true') {
      Navigator.of(context).pop();
    }
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
        child: Form(
          key: formkey,
          child: ListView(
            children: <Widget>[
              nameText(),
              userText(),
              passwordText(),
            ],
          ),
        ),
      ),
    );
  }
}
