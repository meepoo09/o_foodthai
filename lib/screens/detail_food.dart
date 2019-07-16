import 'package:flutter/material.dart';
import 'package:o_foodthai/models/food_model.dart';

class DetailFood extends StatefulWidget {
  final FoodModel foodModel;
  DetailFood({Key key, this.foodModel}) : super(key: key);
  @override
  _DetailFoodState createState() => _DetailFoodState();
}

class _DetailFoodState extends State<DetailFood> {
  FoodModel foodModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foodModel = widget.foodModel;
  }

  Widget showImage(int index) {
    return Container(
        width: 180,
        height: 150.0,
        margin: EdgeInsets.only(right: 30.0),
        child: Image.network(
          foodModel.ImagePath,
          fit: BoxFit.contain,
        ));
  }

  Widget showNameFood(int index) {
    return Container(
        alignment: Alignment.topCenter,
        child: Text(
          foodModel.NameFood,
          style: TextStyle(fontSize: 18.0, color: Colors.teal),
        ));
  }

  Widget showDetailFood(int index) {
    return Container(
        margin: EdgeInsets.only(left: 16.0),
        alignment: Alignment.topLeft,
        child: Text(
          foodModel.Detail,
          style: TextStyle(fontSize: 14.0, color: Colors.black),
        ));
  }
  Widget showText(int index) {
    return Expanded(
        child: Column(
      children: <Widget>[
        showImage(0),
        showNameFood(0),
        showDetailFood(0),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(foodModel.NameFood),
        ),
        body: Center(
          child: Container(
         
            child: Row(
              children: <Widget>[
                
                showText(0),
              ],
            ),
          ),
        ));
  }
}
