import 'package:flutter/material.dart';

//final ThemeData themes = ThemeData(
//  primaryColor: Color(0xFF262634),
//  scaffoldBackgroundColor: Color(0xFF090C22),
//  accentColor: Color(0xFFEA1556),
//  textTheme: TextTheme(
//    bodyText1: TextStyle(color: Colors.white),
//    bodyText2: TextStyle(color: Colors.white),
//  ),
//);

const Color backgroundColour = Color(0xFF090C22);
const Color highlightColour = Color(0xFFEB1555);
const Color cardColour = Color(0xFF2c305b);
const Color cardColourActive = Color(0xFF2861b7);

final ThemeData themes = ThemeData.dark().copyWith(
  primaryColor: backgroundColour,
  scaffoldBackgroundColor: backgroundColour,
  accentColor: highlightColour,
);

const labelTextStyle = TextStyle(
  fontSize: 18,
  color: Color(0xFF8D8E98),
);
