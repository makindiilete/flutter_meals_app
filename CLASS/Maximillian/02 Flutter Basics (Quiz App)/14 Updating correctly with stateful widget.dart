/*
Now we will see the correct way to update our state
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
    return MyAppState();
  }

}

//We change this from Stateless widget to just State because here we have our dynamic state
class MyAppState extends State<MyApp>{
  var questionIndex = 0;// our state


  //d button pressed event calls ds method which updates d index of our question
  void answerQuestion(){
    //we update d state (increment our question index) inside setState
    setState(() {
      questionIndex = questionIndex == 0 ? questionIndex + 1 : 0; //Since our array contains only two elements, the app we break when we increment the index to 2 because the app we try to pick the 3rd element and render it and it doesnt exist so we attach a condition to go back to 0 after our index is incremented to 1
    });
    //We then print d current index to the console
    print(questionIndex);
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
            Text(questions[questionIndex]), //from d question array, we print the element at this dynamic index
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
