/*
We have seen one possible way of connecting our buttons to functions... In cases where we only want to use the function on only a particular element/widget and we wont be using it elsewhere, we can use an anonymous/arrow function.. Anonymous functions are functions without a name
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
//       We binded the button pressed event to the answerQuestion function.. Since the fn is void and returns ntin, calling it on the event trigger, we need to call it without (), else if we call it as answerQuestion() then we are passing the "value" the fn returns to the event and not the function itself
            RaisedButton(onPressed: answerQuestion, child: Text("Answer 1"),),
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
