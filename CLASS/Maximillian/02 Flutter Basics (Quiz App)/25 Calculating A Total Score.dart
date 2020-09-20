/*
Now we want to make the app more advance by giving our answers different score depending on how negative they sounds.... Color of black will take 10 while white will take 1.. To do this, we convert our answers string into another object
*/

//quiz.dart
import 'package:flutter/material.dart';

import "./answer.dart"; // we import Answer class
import './question.dart'; // we import our Question class

class Quiz extends StatelessWidget {
  final Function
  answerQuestion; // field to hold our answerQuestion handler which will be passed to this class from main.dart via the constructor
  final int
  questionIndex; // field to hold our question index which we receive from main.dart
  final List<Map<String, Object>> questions; // field to hold our question list

  //we declare a constructor which receives all values this class needs
  Quiz(
      {@required this.answerQuestion,
        @required this.questions,
        @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
//    We basically moved the Column widget into this file and we map all the variables to our class fields
    return Column(
      children: <Widget>[
        //from the "questions" array, go to index of "_questionIndex" which is our dynamic index, select the object with key "questionText"
        Question(questions[questionIndex]["questionText"]),
        ...(questions[questionIndex]["answers"] as
        //Now our answer list is not longer list of string but a map (an object) of sting and object (bcos we have both string and int values)
        List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            //now we create anonymous fn and we pass the value of the "score" key of the selected answer
                  () => answerQuestion(answer["score"]),
              //now we pick the "text" key from our answers list
              answer['text']);
        }).toList()
      ],
    );
  }
}



//main.dart
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
            Result()));
  }
}
