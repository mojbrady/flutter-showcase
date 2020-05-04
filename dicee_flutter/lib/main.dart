import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(DiceApp());
}

class DiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dicee',
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red.shade400,
        ),
        body: DicePage(),
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() {
    return new _DicePageState();
  }
}

class _DicePageState extends State<DicePage> {
  final padding = EdgeInsets.all(16.0);
  int leftNum = 1, rightNum = 1;

  Image _getDiceImage(int index) {
    return Image.asset('images/dice$index.png');
  }

  void throwDice() {
    setState(() {
      leftNum = 1 + Random().nextInt(6);
      rightNum = 1 + Random().nextInt(6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                throwDice();
              },
              child: _getDiceImage(leftNum),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                throwDice();
              },
              child: _getDiceImage(rightNum),
            ),
          ),
        ],
      ),
    );
  }
}
