/*
We want to create a custom widget outside our main.dart file so that we can move our text into another component..
To do this, the parent component (main.dart) will need to pass the Text widget as props to the question.dart component..
For the child component to receive props from the parent, we need to define a property and a constructor in the child class, the property will be a "type" of the type of data we are expecting which is "String" in this case

The constructor will then receive this property as parameter and pass it to the build method of the child component
*/

//Question.dart
import 'package:flutter/material.dart';


//This class will hold our question widget which will be a Text widget and the value of the text is elements of array passed from main.dart
class Question extends StatelessWidget {
  //property
  final String questionText; //ds fixed d error "class is immutable but property arent final".. d "final" keyword is equivalent to "const" in javascript which means d value will never change inside ds class

  //constructor : - Ds constructor will be called by main.dart and the arg for ds parameter will be passed
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    //We return a text widget from the value passed to the constructor
    return Text(questionText);
  }
}


//Main.dart
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/question.dart';//impporting material design package that contains StatelessWidget

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
class _MyAppState extends State<MyApp>{
  var _questionIndex = 0;// our state


  void _answerQuestion(){
    //we update d state inside setState
    setState(() {
      _questionIndex = _questionIndex == 0 ? _questionIndex + 1 : 0;
    });
    print(_questionIndex);
  }
  @override
  Widget build(BuildContext context) {
    //Question lists (array)
    var questions = ["What's your favorite color?", "What's your favorite animal"];
    // Scaffold is a widget that gives us a UI, theme etc of a regular mobile app
    return MaterialApp(home: Scaffold(
      //creates an appBar with the "AppBar" class which takes a title & text widget
        appBar: AppBar(title: Text("My First App"),),
        //body : - widget that defines the body of the app
        body: Column(
          children: <Widget>[
//       Text(questions[_questionIndex]),
            Question(questions[_questionIndex]), //Instead of our text widget, we are calling the constructor of question.dart and supplying the argument required
            RaisedButton(onPressed: _answerQuestion, child: Text("Answer 1"),),
            RaisedButton(onPressed: () => print("Answer Two Chosen"), child: Text("Answer 2"),),
            RaisedButton(onPressed: () {
              //....
              print("This is for function with multi-line body");
            }, child: Text("Answer 3"),),
          ],
        )
    )
    );
  }

}

