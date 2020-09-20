/* 
Maps : - Maps are collections of key value pairs, they are like javascript objects with a little difference which is both the key and value must be in quotes i.e. must be a string e.g. 
{'key' : 'value'}
Now we want to render some meaningful text on our button instead of the static "Answer 1" and also apply some text color.
We will start by changing our "questions" array to maps (object) then in the next episode we will map this object to our widget
 */

//main.dart
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
      _questionIndex = _questionIndex == 0 ? _questionIndex + 1 : 0;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    //Question lists (array)
    var questions = [
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
        "answers": ["Max", "Mosh", "Transversy", "Leon"]
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
            body: Column(
              children: <Widget>[
//       Text(questions[_questionIndex]),
                Question(questions[
                    _questionIndex]), //Instead of our text widget, we are calling the constructor of question.dart and supplying the argument required
                Answer(
                    _answerQuestion), //we pass our answerQuestion fn handler to our Answer class
                Answer(_answerQuestion),
                Answer(_answerQuestion),
              ],
            )));
  }
}
