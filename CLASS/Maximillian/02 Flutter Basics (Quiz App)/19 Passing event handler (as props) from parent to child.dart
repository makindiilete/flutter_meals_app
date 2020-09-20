/*
Now we want to move our buttons into a separate component and style them... Our buttons are connected to the "_answerQuestion()" of the main.dart component so when we create a new component for the buttons, we need to also pass the function as props to the created component

To do this, the parent component (main.dart) will need to pass the _answerQuestion() as props to the answer.dart component..
For the child component to receive props from the parent, we need to define a property and a constructor in the child class, the property will be a "type" of the type of data we are expecting which is "Function" in this case

The constructor will then receive this property as parameter and pass it to the build method of the child component
*/

//answer.dart
import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler; //here we declare a property which is a function

  Answer(
      this.selectHandler); //we create a constructor with which we will be able to receive properties & methods from the parent compoonent

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        onPressed:
            selectHandler, // we set our onPressed event to the function we receive from the parent component
        child: Text("Answer 1"),
      ),
    );
  }
}


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
      "What's your favorite color?",
      "What's your favorite animal"
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
