import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xylophone',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: KeyboardWidget(),
        ),
      ),
    );
  }
}

class KeyboardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        KeyWidget(
          id: 1,
          color: Colors.red,
        ),
        KeyWidget(
          id: 2,
          color: Colors.orange,
        ),
        KeyWidget(
          id: 3,
          color: Colors.yellow,
        ),
        KeyWidget(
          id: 4,
          color: Colors.green,
        ),
        KeyWidget(
          id: 5,
          color: Colors.teal,
        ),
        KeyWidget(
          id: 6,
          color: Colors.blue,
        ),
        KeyWidget(
          id: 7,
          color: Colors.purple,
        ),
      ],
    );
  }
}

class KeyWidget extends StatelessWidget {
  final int id;
  final Color color;

  KeyWidget({this.id = 1, this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        color: color,
        child: Text('$id'),
        onPressed: () {
          _playSound(id);
        },
      ),
    );
  }
}

final _player = AudioCache();
void _playSound(int id) {
  _player.play('note$id.wav');
}
