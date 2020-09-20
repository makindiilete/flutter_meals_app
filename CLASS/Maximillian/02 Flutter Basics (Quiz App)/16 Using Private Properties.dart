/*
We can turn a class or properties into a private properties if we dont want them to be used or manipulated outside the current file where they are declared..
To turn a property to private in dart, we simply add "_" underscore before the name
*/

import 'package:flutter/material.dart';//impporting material design package that contains StatelessWidget

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
        //Center : - creates a widget that centers its "child" on the screen
        body: Column(
          children: <Widget>[
//       Text(questions.elementAt(0)),
            Text(questions[_questionIndex]),
//       We binded the button pressed event to the answerQuestion function.. Since the fn is void and returns ntin, calling it on the event trigger, we need to call it without (), else if we call it as answerQuestion() then we are passing the "value" the fn returns to the event and not the function itself
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
