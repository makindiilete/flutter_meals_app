/* 
Now that we have created our list, we want to map the list to our widget..
1)  We will map our list key to our questionText widget
2)  We will map our list value "answers" to our Answer widget
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
            body: Column(
              children: <Widget>[
                //from the "questions" array, go to index of "_questionIndex" which is our dynamic index, select the object with key "questionText"
                Question(questions[_questionIndex]["questionText"]),
                //We spread the question list/array picking the index received and selecting the answers property
                ...(questions[_questionIndex]["answers"] as List<String>)
                //we map it to a variable "answer"
                    .map((answer) {
                      //we return an Answer widget which is a button that takes our onPressed handler and answer text
                  return Answer(_answerQuestion, answer);
                }).toList()
              ],
            )));
  }
}



//answers.dart
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler; //here we declare a property which is a function
  final String answer; //here we declare a property that will carry the value of our answer
  Answer(this.selectHandler,
      this.answer); //we create a constructor with which we will be able to receive properties & methods from the parent compoonent

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        textColor: Colors.white,
        onPressed:
        selectHandler, // we set our onPressed event to the function we receive from the parent component
        child: Text(this.answer), // we set our answer property to a text widget
      ),
    );
  }
}

