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
        child: Text('HELLO!', style: Theme.of(context).textTheme.headline1),
      ),
      drawer: Text('Drawer'),
      floatingActionButton: FloatingActionButton(
          onPressed: () => print('Pressed floating button'),
          child: Icon(Icons.add)),
    );
  }
}
