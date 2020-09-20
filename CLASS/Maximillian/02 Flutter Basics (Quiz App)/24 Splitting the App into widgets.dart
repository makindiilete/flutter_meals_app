/*
Now we have our tenary operator code in main.dart file looking not readable.. To make it more readable, we will split the app into two different custom widgets : - We render one when the condition is true and render the other when the condition is false.

1.  Add 2 new files : - quiz.dart & result.dart
*/

//Move the column widget into our "quiz.dart" file
import 'package:flutter/material.dart';

//This class will hold our question widget which will be a Text widget and the value of the text is elements of array passed from main.dart
class Question extends StatelessWidget {
  //property
  final String
  questionText; //ds fixed d error "class is immutable but property arent final".. d "final" keyword is equivalent to "const" in javascript which means d value will never change inside ds class

  //constructor : - Ds constructor will be called by main.dart and the arg for ds parameter will be passed
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    //We return a text widget from the value passed to the constructor
    //We center d text on d screen
    return Container(
      width: double.infinity, //ds set d width of the container to maximum
      margin: EdgeInsets.all(10), //ds adds 10px margin all around the text
      child: Text(
        questionText,
        //styling
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}


//Main.dart
import 'package:flutter/material.dart';

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

  void _answerQuestion() {
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
        "answers": ["Blue", "Red", "Green", "White"]
      },
      {
        "questionText": "What's your favorite animal?",
        "answers": ["Lion", "Hen", "Goat", "Tiger"]
      },
      {
        "questionText": "What's your favorite instructor?",
        "answers": ["Max", "Mosh", "Transversely", "Leon"]
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
                : Center(
              child: Text("You did it..."),
            )));
  }
}


//Result.dart
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //we move our "center text" widget to this file
    return Center(
      child: Text("You did it..."),
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

  void _answerQuestion() {
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
        "answers": ["Blue", "Red", "Green", "White"]
      },
      {
        "questionText": "What's your favorite animal?",
        "answers": ["Lion", "Hen", "Goat", "Tiger"]
      },
      {
        "questionText": "What's your favorite instructor?",
        "answers": ["Max", "Mosh", "Transversely", "Leon"]
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

