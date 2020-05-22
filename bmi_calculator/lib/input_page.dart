import 'package:bmicalculator/labeled_icon.dart';
import 'package:bmicalculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/tile.dart';

enum Gender {
  MALE,
  FEMALE,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  double selectedHeight = 150;

  void updateCardColours(Gender gender) {
    setState(() {
      this.selectedGender = gender;
    });
  }

  void updateHeight(double value) {
    setState(() {
      this.selectedHeight = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Tile(
                onClick: () => updateCardColours(Gender.MALE),
                colour: (selectedGender == Gender.MALE)
                    ? kActiveCardColour
                    : kInactiveCardColour,
                height: 170,
                child: LabeledIcon(
                  icon: FontAwesomeIcons.male,
                  label: 'MALE',
                ),
              ),
              Tile(
                onClick: () => updateCardColours(Gender.FEMALE),
                colour: (selectedGender == Gender.FEMALE)
                    ? kActiveCardColour
                    : kInactiveCardColour,
                height: 170,
                child: LabeledIcon(
                  icon: FontAwesomeIcons.female,
                  label: 'FEMALE',
                ),
              ),
            ],
          ),
          Tile(
            colour: kActiveCardColour,
            height: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'HEIGHT',
                  style: kLabelTextStyle,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      '$selectedHeight',
                      style: kNumberTextStyle,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                Slider(
                  onChanged: (value) => updateHeight(value),
                  min: 50,
                  max: 250,
                  value: selectedHeight,
                  activeColor: Colors.red,
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Tile(
                colour: kActiveCardColour,
                height: 170,
              ),
              Tile(
                colour: kActiveCardColour,
                height: 170,
              ),
            ],
          ),
          Container(
            color: kAccentColor,
            width: double.infinity,
            height: 80,
          ),
        ],
      ),
    );
  }
}
