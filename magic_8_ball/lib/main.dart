import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Magic 8 Ball',
        home: Magic8BallApp()),
  );
}

class Magic8BallApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('Ask Me Anything'),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: Center(
            child: Padding(
          padding: EdgeInsets.all(16),
          child: MagicBallWidget(),
        )));
  }
}

class MagicBallWidget extends StatefulWidget {
  @override
  _MagicBallWidgetState createState() => _MagicBallWidgetState();
}

class _MagicBallWidgetState extends State<MagicBallWidget> {
  int _number = 1;
  void _shakeBall() {
    setState(() {
      int tmp = _number;
      while (tmp == _number) {
        _number = Random().nextInt(5) + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => _shakeBall(),
      child: Image.asset('images/ball$_number.png'),
    );
  }
}
