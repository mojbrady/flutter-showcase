import 'package:bmicalculator/labeled_icon_button.dart';
import 'package:bmicalculator/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/card.dart';

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
              Cardd(
                colour: cardColourActive,
                height: 170,
                child: LabeledIconButton(
                  icon: FontAwesomeIcons.male,
                  label: 'MALE',
                ),
              ),
              Cardd(
                colour: cardColour,
                height: 170,
                child: LabeledIconButton(
                  icon: FontAwesomeIcons.female,
                  label: 'FEMALE',
                ),
              ),
            ],
          ),
//          Row(
//            children: <Widget>[
          Cardd(
            colour: cardColour,
            height: 170,
          ),
//            ],
//          ),
          Row(
            children: <Widget>[
              Cardd(
                colour: cardColour,
                height: 170,
              ),
              Cardd(
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
