import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LabeledIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  LabeledIcon({@required this.icon, @required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
