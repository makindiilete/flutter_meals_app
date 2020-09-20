/*
We have an array of 3 elements and we have an index variable that we always add one to anytime we click on the buttons, instead of allowing our app to break after we display the 3rd question in the list, we can instead render a new widget
*/

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart'; //impporting material design package that contains StatelessWidget

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
    final questions = [
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
            body: _questionIndex < questions.length
                ? Column(
              children: <Widget>[
                //from the "questions" array, go to index of "_questionIndex" which is our dynamic index, select the object with key "questionText"
                Question(questions[_questionIndex]["questionText"]),
                ...(questions[_questionIndex]["answers"] as List<String>)
                    .map((answer) {
                  return Answer(_answerQuestion, answer);
                }).toList()
              ],
            )
                : Center(
              child: Text("You did it..."),
            )));
  }
}

