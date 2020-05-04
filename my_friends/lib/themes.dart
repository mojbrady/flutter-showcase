
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

final diggerTheme = ThemeData(
  primarySwatch: Colors.yellow,
  primaryColor: Colors.yellow.shade600,// not necessary when primarySwatch is defined as above
  accentColor: Colors.pinkAccent.shade400,
  primaryColorBrightness: Brightness.light,
  cardColor: Colors.yellow.shade900,
);

final rainbowTheme = ThemeData(
  primarySwatch: Colors.cyan,
  primaryColor: Colors.cyan,// not necessary when primarySwatch is defined as above
  accentColor: Colors.redAccent.shade400,
  primaryColorBrightness: Brightness.dark,
  cardColor: Colors.orange.shade400,
  backgroundColor: Colors.purple,

);

final greenTheme = ThemeData(
  fontFamily: "Ubuntu",
  primarySwatch: Colors.lightGreen,
  primaryColor: Colors.lightGreen.shade600,// not necessary when primarySwatch is defined as above
  accentColor: Colors.orangeAccent.shade400,
  primaryColorBrightness: Brightness.dark,
  cardColor: Colors.lightGreen.shade100,
);

final purpleTheme = ThemeData(
  fontFamily: "Ubuntu",
  primarySwatch: Colors.purple,
  primaryColor: Colors.purple.shade600,// not necessary when primarySwatch is defined as above
  accentColor: Colors.pinkAccent.shade400,
  primaryColorBrightness: Brightness.dark,
  cardColor: Colors.purple.shade100,
  buttonColor: Colors.pinkAccent.shade400,
  focusColor: Colors.pinkAccent.shade400,
  selectedRowColor: Colors.pinkAccent.shade400,
);

class MaterialAppDefaultTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Colors.blue,
        child: Center(
          child: Text("Simple Text"),
        ),
      ),
    );
  }
}

class MyFriendsTheme extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Theme(
          isMaterialAppTheme: true,
          data: Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.copyWith(
              headline1: TextStyle(
                color: Colors.yellow
              )
            )
          ),
          child: Builder(
            builder: (context) => Text(
              "Simple Text",
              textDirection: TextDirection.ltr,
              style: Theme.of(context).textTheme.headline1,
            ),
          )
        ),
      )
    );
  }

}
