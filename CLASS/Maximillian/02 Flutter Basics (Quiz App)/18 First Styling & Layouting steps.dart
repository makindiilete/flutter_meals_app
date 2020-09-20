/*
We want to start by styling our question text...
We want to start by : -
# Increasing the fontSize
# Centering the text on the screen horizontally
*/

//Method 1
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
    //We center d text on d screen
    return Center(child: Text(questionText,
      //styling
      style: TextStyle(fontSize: 28),
      textAlign: TextAlign.center,),);
  }
}


//Method 2
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
    //We center d text on d screen
    return Container(width: double.infinity, child: Text(questionText,
      //styling
      style: TextStyle(fontSize: 28),
      textAlign: TextAlign.center,),);
  }
}


//question.dart
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
    //We center d text on d screen
    return Container(
      width: double.infinity, //ds set d width of the container to maximum
      margin: EdgeInsets.all(10), //ds adds 10px margin all around the text
      child: Text(questionText,
        //styling
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,),);
  }
}
