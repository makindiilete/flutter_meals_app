/* 
We want to use the basic structure of flutter app to render an app that prints Hello World to the center of the screen with a navbar of green
 */

//main.dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('Home'), 
      backgroundColor: Colors.green[400],
    ),
    body: Center(child: Text("Hello Word"),),
  ),
);
  }
}


//Added floating Action button with Favorite icon
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  var count = 1;
    return MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('Home'), 
      backgroundColor: Colors.green[400],
    ),
    body: Center(child: Text("Hello Word"),),
    floatingActionButton: FloatingActionButton(onPressed: () => {
      print("Button Clicked $count times"),
      count++
    }, backgroundColor: Colors.green[400], child: Icon(Icons.favorite, color: Colors.white), ),
  ),
);
  }
}


//Changed the floating button to an extended floating icon button that shows number of messages a user has
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  var count = 1;
    return MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('Home'), 
      backgroundColor: Colors.green[400],
    ),
    body: Center(child: Text("Hello Word"),),
    floatingActionButton: FloatingActionButton.extended(backgroundColor: Colors.green[400], icon: Icon(Icons.message, color: Colors.white), label: Text(count.toString()), onPressed: null,),
  ),
);
  }
}
