import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/quiz_master.dart';

QuizMaster quizMaster = QuizMaster();

void main() {
  runApp(QuizzlerApp());
}

class QuizzlerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizzler',
      home: Scaffold(
        backgroundColor: Colors.grey.shade600,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: QuizzPage(),
          ),
        ),
      ),
    );
  }
}

class QuizzPage extends StatefulWidget {
  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  List<Widget> scoreKeeper = [];

  void checkScore(bool answer) {
    setState(() {
      scoreKeeper.add(
          (quizMaster.checkAnswer(answer)) ? createCheck() : createClose());
    });
    quizMaster.nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Center(
            child: createText(
              quizMaster.getQuestion(),
              25,
            ),
          ),
        ),
        createButton(
          text: 'True',
          color: Colors.green,
          onPressed: () => checkScore(true),
        ),
        createButton(
          text: 'False',
          color: Colors.red,
          onPressed: () => checkScore(false),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }

  Widget createCheck() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Icon(
        Icons.check,
        color: Colors.green,
      ),
    );
  }

  Widget createClose() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Icon(
        Icons.close,
        color: Colors.red,
      ),
    );
  }

  Widget createButton({String text, Function onPressed, Color color}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FlatButton(
          onPressed: onPressed,
          color: color,
          child: createText(text, 20),
        ),
      ),
    );
  }

  Widget createText(String text, double fontSize) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
      ),
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
