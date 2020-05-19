import 'package:bmicalculator/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Card(
                colour: cardColourActive,
                height: 170,
              ),
              Card(
                colour: cardColour,
                height: 170,
              ),
            ],
          ),
//          Row(
//            children: <Widget>[
          Card(
            colour: cardColour,
            height: 170,
          ),
//            ],
//          ),
          Row(
            children: <Widget>[
              Card(
                colour: cardColour,
                height: 170,
              ),
              Card(
                colour: cardColour,
                height: 170,
              ),
            ],
          ),
          Container(
            color: highlightColour,
            width: double.infinity,
            height: 80,
          ),
        ],
      ),
    );
  }
}

class Card extends StatelessWidget {
  final double height;
  final Color colour;
  final Widget child;

  Card({this.colour, this.height, this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: height,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        child: child,
      ),
    );
  }
}
