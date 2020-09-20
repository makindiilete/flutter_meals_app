/*
Now its time to render something more meaningful and eyes pleasing. e.g. We can make the background white and change the text..
To achieve this, we will be combining couple of widgets together to present something meaningful.
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
    // Scaffold is a widget that gives us a UI, theme etc of a regular mobile app
    return MaterialApp(home: Scaffold(
      //creates an appBar with the "AppBar" class which takes a title & text widget
        appBar: AppBar(title: Text("My First App"),),
        //body : - widget that defines the body of the app
        //Center : - creates a widget that centers its "child" on the screen
        body: Center(child: Text("Welcome To My First App"),)
    )

    );
  }

}
