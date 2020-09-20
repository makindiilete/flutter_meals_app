/* 
Rendering Text : - As all text must be wrapped with <View> tag, in flutter, all text must be wrapped inside a Text() widget

FLUTTER FOLDER STRUCTURE VS REACT

"lib" ==> This is react "src" folder
"main.dart" ==> This is react index.js, index.js in react return App.js, main.dart also returns the name of our App root class
 */

// STRUCTURE OF A FLUTTER APP IN COMPARISON WITH REACT

// import React, { Component } from "react";
import 'package:flutter/material.dart';


//ReactDOM.render(<App />, document.getElementById("root"));
void main() => runApp(MyApp())

  //class Dashboard extends Component {
class MyApp extends StatelessWidget {

    //render() {
  @override
  Widget build(BuildContext context) {
    //////RENDER UR VARIABLES HERE/////
    final name = "Michaelz"; //const name = "Michaelz";
    var data = []; //let data = [];

    //return null
    return null;

    //OR WE RETURN A WIDGET e.g. The Material App Widget that uses material design to render our layout structure using the Scaffold widget

    /* 
        return MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Text('Home'),
    ),
  ),
);
     */
  }
}


//SCAFFOLD WIDGET : - https://api.flutter.dev/flutter/material/Scaffold-class.html
/* 
Implements the basic material design visual layout structure.
This widget is responsible for implement our layout interface of material design, it takes different properties for defining the structure e.g. :
1) appBar : AppBar ==>> A widget that renders our app nav bar
2) body : Center (or any other widget) ==>> A widget that centers our element vertical and horizontally on the screen
3) floatingActionButton : FloatingActionButton ==>> A widget that renders our primary actions of the app on a circular floating button with icon
 */


