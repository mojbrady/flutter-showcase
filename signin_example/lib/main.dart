import 'package:flutter/material.dart';
import 'package:signin_example/hello.dart';
import 'package:signin_example/login_screen.dart';
import 'package:signin_example/welcome_screen.dart';

var routes = {
  '/': (context) => LoginScreen(),
  '/login': (context) => LoginScreen(),
  '/welcome': (context) => WelcomeScreen(),
  '/hello': (context) => HelloScreen(),
};

void navigateToWelcomeScreen(BuildContext context) =>
    Navigator.pushNamed(context, '/welcome');

//-----------------------------------------------------------

void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
    );
  }
}
