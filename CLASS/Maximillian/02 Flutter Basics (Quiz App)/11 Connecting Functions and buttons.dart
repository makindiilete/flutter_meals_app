/*
The onPressed() event of a button is meant to be connected to a function, so we will learn how to do this in this module
*/
import 'package:flutter/material.dart';//impporting material design package that contains StatelessWidget

void main() {
//  in d main method, we call d "runApp()" and pass our class (widget) as argument
  runApp(MyApp());
}

//Here we create our widget which make up our class
class MyApp extends StatelessWidget{
  void answerQuestion(){
    print("Question answered");
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
            Text("The Question"),
//       We binded the button pressed event to the answerQuestion function.. Since the fn is void and returns ntin, calling it on the event trigger, we need to call it without (), else if we call it as answerQuestion() then we are passing the "value" the fn returns to the event and not the function itself.. Another reason why we need to call the function without () is because we only want this function to fire when an event happens i.e. When a user press the button.. calling the function with () will make the function runs immediately the app is launch and the compiler read that line.
            RaisedButton(onPressed: answerQuestion, child: Text("Answer 1"),),
            RaisedButton(onPressed: answerQuestion, child: Text("Answer 2"),),
            RaisedButton(onPressed: answerQuestion, child: Text("Answer 3"),),
          ],
        )
    )
    );
  }

}
