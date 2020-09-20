/*
We will build a simple app just to render a text on the screen
*/

import 'package:flutter/material.dart';//impporting material design package that contains StatelessWidget

void main() {
//  in d main method, we call d "runApp()" and pass our class (widget) as argument
  runApp(MyApp());
}

//Here we create our widget which make up our class
class MyApp extends StatelessWidget{
  //WE WRITE ALL OUR METHODS AND VARIABLES HERE
  /*
  .....
  */

  //Anything inside this build method is like our return statement in react and u know we sudnt have our methods there
  @override //ds is a decorator that states that we are overriding the build() of StatelessWidget with the build method of MyApp()
  //build() is a function that returns a widget and take BuildContext as parameter
  //ds build function is what dart & flutter will call when they try to draw something onto the screen
  Widget build(BuildContext context) {
    // TODO: implement build
    //We return a material App which takes a "home" widget and return a text widget which we use to type something onto the screen
    return MaterialApp(home: Text("Hello!"),);
  }

}

