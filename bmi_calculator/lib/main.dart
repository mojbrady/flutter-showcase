import 'package:bmicalculator/input_page.dart';
import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

var routes = {
  '/': (context) => InputPage(),
  '/moo': (context) => InputPage(),
};

var themes = ThemeData.dark().copyWith(
  primaryColor: kBackgroundColour,
  scaffoldBackgroundColor: kBackgroundColour,
  accentColor: kAccentColor,
);

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: themes,
      routes: routes,
    );
  }
}
