/*
Now instead of rendering a static text on the screen, we want to render a dynamic text that changes when we click on a button...
To do this, we bind the text widget to the the index of a question in the question list and update this index when we click on the button
*/

import 'package:flutter/material.dart';//impporting material design package that contains StatelessWidget

void main() {
//  in d main method, we call d "runApp()" and pass our class (widget) as argument
  runApp(MyApp());
}

//Here we create our widget which make up our class
class MyApp extends StatelessWidget{
  var questionIndex = 0; //default index

  //ds function is called by the button pressed event and it updates the index of our question
  void answerQuestion(){
    questionIndex = questionIndex + 1; //we increment the index when ds fn triggers
    print(questionIndex); //we print the current index in the console
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
            Text(questions[questionIndex]), //we print the current question @ d current index set by answerQuestion()
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

/*
Now what we notice is that the index changes when we click the button but the text does not change.. The reason this happens is because we are changing the state of the class but for the class we are using s Stateless Widget and for stateless, the state is immutable.. So we are using the Stateless widget with a wrong class
*/
