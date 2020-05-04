import 'package:flutter/material.dart';

var routes = {
  '/': (context) => IAmRichScreen(),
};

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
//    routes: routes,
      home: IAmRichScreen(),
    ),
  );
}

class IAmRichScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade700,
        title: Text('I Am Rich'),
        centerTitle: true,
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/diamond.png'),
        ),
      ),
    );
  }
}
