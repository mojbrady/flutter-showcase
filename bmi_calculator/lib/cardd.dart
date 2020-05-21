import 'package:flutter/material.dart';

class Cardd extends StatelessWidget {
  final double height;
  final Color colour;
  final Widget child;
  final Function onClick;

  Cardd({this.colour, this.height, this.child, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          height: height,
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colour,
          ),
          child: child,
        ),
      ),
    );
  }
}
