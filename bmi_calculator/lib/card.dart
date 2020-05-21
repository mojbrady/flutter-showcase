import 'package:flutter/material.dart';

class Cardd extends StatelessWidget {
  final double height;
  final Color colour;
  final Widget child;

  Cardd({this.colour, this.height, this.child});

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
