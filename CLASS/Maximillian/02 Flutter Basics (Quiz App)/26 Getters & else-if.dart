/*
Now we want to render different text on the screen base on the result score we received.. There are two ways we can do this..
*/

//METHOD 1
//result.dart
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  Result({this.totalScore});

  @override
  Widget build(BuildContext context) {
    //we move our "center text" widget to this file
    if (totalScore <= 10) {
      return Center(
        child: Text("You are awesome : " + totalScore.toString(),
            style: TextStyle(
                color: Colors.green,
                fontSize: 36,
                fontWeight: FontWeight.bold)),
      );
    } else {
      return Center(
        child: Text("You are so bad : " + totalScore.toString(),
            style: TextStyle(
                color: Colors.red, fontSize: 36, fontWeight: FontWeight.bold)),
      );
    }
  }
}


//METHOD 2 (Getters)
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  Result({this.totalScore});

  String get resultPhrase {
    String resultText;
    if (totalScore <= 8) {
      resultText = "You are awesome and so innocent!";
    } else if (totalScore <= 12) {
      resultText = "Pretty likable!";
    } else if (totalScore <= 16) {
      resultText = "You are strange!";
    } else {
      resultText = "You are so bad!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    //we move our "center text" widget to this file
    return Center(
      child: Text(
        resultPhrase,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}

//Main.dart
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';

void main() {
//  in d main method, we call d "runApp()" and pass our class (widget) as argument
  runApp(MyApp());
}

//To update the state, we create a separate class which will be a stateful widget and return our first class where we have the dynamic state and the outputs
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

//We change this from Stateless widget to just State because here we have our dynamic state
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0; // our state
  var _totalScore = 0;

  /*now we need our _answerQuestion to receive an int of score*/
  void _answerQuestion(int score) {
    _totalScore +=
        score; // we increment the value of total score to the score that is passed to this function
    //we update d state inside setState
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    //Question lists (array)
    final _questions = [
      {
        "questionText": "What's your favorite color?",
        "answers": [
          {"text": "Black", "score": 10},
          {"text": "Red", "score": 5},
          {"text": "Green", "score": 3},
          {"text": "White", "score": 1}
        ]
      },
      {
        "questionText": "What's your favorite animal?",
        "answers": [
          {"text": "Lion", "score": 10},
          {"text": "Hen", "score": 1},
          {"text": "Goat", "score": 3},
          {"text": "Tiger", "score": 8}
        ]
      },
      {
        "questionText": "What's your favorite instructor?",
        "answers": [
          {"text": "Max", "score": 1},
          {"text": "Mosh", "score": 10},
          {"text": "Transversely", "score": 8},
          {"text": "Leon", "score": 0}
        ]
      }
    ];
    // Scaffold is a widget that gives us a UI, theme etc of a regular mobile app
    return MaterialApp(
        home: Scaffold(
          //creates an appBar with the "AppBar" class which takes a title & text widget
            appBar: AppBar(
              title: Text("My First App"),
            ),
            //body : - widget that defines the body of the app
            body: _questionIndex < _questions.length
            //            Now we call our Quiz class and we pass all the constructor required values
                ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
                :
            //here we import our Result class
            Result(
              totalScore: _totalScore,
            )));
  }
}