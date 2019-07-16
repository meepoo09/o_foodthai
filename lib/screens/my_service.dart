import 'package:flutter/material.dart';
import 'package:o_foodthai/models/food_model.dart';
import 'package:o_foodthai/models/user_model.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

import 'package:o_foodthai/screens/detail_food.dart';

class MyService extends StatefulWidget {
  final UserModel userModel;
  MyService({Key key, this.userModel}) : super(key: key);
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  UserModel userModel;
  List<FoodModel> foodModels = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userModel = widget.userModel;
    print('name = ${userModel.name}');
    readAlldata();
  }



  Widget showTitle() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text('Food Service'),
    );
  }

  Widget showUser() {
    return Container(
      alignment: Alignment.topLeft,
      child: Text(
        'Welcome ${userModel.name} ',
        style: TextStyle(fontSize: 14.0),
      ),
    );
  }

  Widget titleAppBar() {
    return Column(
      children: <Widget>[
        showTitle(),
        showUser(),
      ],
    );
  }

  Widget showImage(int index) {
    return Container(
        width: 180,
        height: 150.0,
        margin: EdgeInsets.all(6.0),
        child: Image.network(
          foodModels[index].ImagePath,
          fit: BoxFit.contain,
        ));
  }

  Widget showNameFood(int index) {
    return Container(
        alignment: Alignment.topLeft,
        child: Text(
          foodModels[index].NameFood,
          style: TextStyle(fontSize: 18.0, color: Colors.teal),
        ));
  }

  Widget showDetailFood(int index) {
    return Container(
        margin: EdgeInsets.only(right: 16.0),
        alignment: Alignment.topLeft,
        child: Text(
          detailShort(foodModels[index].Detail),
          style: TextStyle(fontSize: 14.0, color: Colors.black),
        ));
  }

  String detailShort(String detailString) {
    String result = detailString;
    if (detailString.length >= 100) {
      result = detailString.substring(0, 100);
      result = '$result ...';
    }
    return result;
  }

  Widget showText(int index) {
    return Expanded(
        child: Column(
      children: <Widget>[
        showNameFood(index),
        showDetailFood(index),
      ],
    ));
  }
  Future<void> readAlldata() async {
    String url = 'https://www.androidthai.in.th/ooo/getAllFood.php';
    var response = await get(url);
    var result = json.decode(response.body);

    for (var myparseJson in result) {
      FoodModel foodModel = FoodModel.parseJson(myparseJson);
      setState(() {
        foodModels.add(foodModel);
      });
    }
  }
  Widget showListView() {
    return ListView.builder(
      itemCount: foodModels.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            alignment: Alignment.topLeft,
            child: Row(
              children: <Widget>[
                showImage(index),
                showText(index),
              ],
            ),
          ),
          onTap: () {
            var detailRoute = MaterialPageRoute(
                builder: (BuildContext context) => DetailFood(foodModel: foodModels[index],));
                Navigator.of(context).push(detailRoute);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: titleAppBar(),
      ),
      body: showListView(),
    );
  }
}
