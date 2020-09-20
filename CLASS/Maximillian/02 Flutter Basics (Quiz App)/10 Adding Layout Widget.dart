/*
To render a text with a couple of buttons onto the body, we need to use an invisible layout widget.
Column() : - This is used to render widgets/elements vertically on the screen, they stay above each other
Row() : - This is used to render widget/elements horizontally on the screen, they stay beside each other
*/
import 'package:flutter/material.dart';//impporting material design package that contains StatelessWidget

void main() {
//  in d main method, we call d "runApp()" and pass our class (widget) as argument
  runApp(MyApp());
}

//Here we create our widget which make up our class
class MyApp extends StatelessWidget{
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
//       OnPressed() is an event that triggered when the button is pressed, current all buttons will be disabled because its taking a value of null i.e. nothing sud happens when they are pressed
            RaisedButton(onPressed: null, child: Text("Answer 1"),),
            RaisedButton(onPressed: null, child: Text("Answer 2"),),
            RaisedButton(onPressed: null, child: Text("Answer 3"),),
          ],
        )
    )
    );
  }

}

