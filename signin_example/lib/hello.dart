import 'package:flutter/material.dart';

class HelloScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Hello Screen'),
      ),
      body: Center(
        child: Text('Welcome!', style: Theme.of(context).textTheme.headline3),
      ),
      drawer: Text('Drawer'),
      floatingActionButton: FloatingActionButton(
          onPressed: () => print('Pressed floating button'),
          child: Icon(Icons.add)),
    );
  }
}
