import 'package:bmicalculator/labeled_icon.dart';
import 'package:bmicalculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmicalculator/cardd.dart';

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

  void updateCardColours(Gender gender) {
    setState(() {
      this.selectedGender = gender;
    });
  }

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
              Cardd(
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
//          Row(
//            children: <Widget>[
          Cardd(
            colour: kActiveCardColour,
            height: 170,
          ),

//            ],
//          ),
          Row(
            children: <Widget>[
              Cardd(
                colour: kActiveCardColour,
                height: 170,
              ),
              Cardd(
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
