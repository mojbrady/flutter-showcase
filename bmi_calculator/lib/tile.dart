import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final double height;
  final Color colour;
  final Widget child;
  final Function onClick;

  Tile({this.colour, this.height, this.child, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          height: height,
          width: double.infinity,
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
