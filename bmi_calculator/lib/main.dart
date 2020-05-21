import 'package:bmicalculator/input_page.dart';
import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

var routes = {
  '/': (context) => InputPage(),
  '/moo': (context) => InputPage(),
};

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: kBackgroundColour,
        scaffoldBackgroundColor: kBackgroundColour,
        accentColor: kAccentColor,
      ),
      routes: routes,
    );
  }
}
