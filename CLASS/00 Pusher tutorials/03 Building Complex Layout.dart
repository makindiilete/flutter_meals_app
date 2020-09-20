//main.dart : - Our result = https://prnt.sc/u496gh
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// entry point for the app,
// the => operator is shorthand for {} when there is only one line of code
void main() => runApp(MyApp());

// the root widget of our application
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BEAMS"),
          backgroundColor: Color(0xff5E4873),
        ),
        body: complextLayout(),
      ),
    );
  }
}

// replace this method with code in the examples below
Widget myLayoutWidget() {
  return Stack(
    // any unpositioned children (ie, our text) will be aligned at the bottom right
    alignment: Alignment.bottomRight,

    children: [
      // first child in the stack is on bottom
      Image(
          image: AssetImage(
              'assets/images/3cc7762830fb5c76d71511a4c0bcc5a8.jpg')), //            <--- image

      // second child in the stack
      Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'My Perfect Home', //                              <--- text
          style: TextStyle(
            fontSize: 30,
            color: Color(0xff340F59),
            fontWeight: FontWeight.bold,

          ),
        ),
      ),
    ],
  );
}

Widget complextLayout() {
  final msg = "Send Programmable push notifications to iOS and Android devices with delivery and open rate tracking built in.";
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(color: Color(0xff300d4f), borderRadius: BorderRadius.circular(10)),
//    color: Color(0xff300d4f),
    child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      firstRow(),
      secondRow(msg),
      thirdRow(),
    ],),
  );
}

Row thirdRow() {
  return Row(children: <Widget>[
    Text("EXPLORE BEAMS", style: TextStyle( color: Colors.green, fontWeight: FontWeight.bold),),
    Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Icon(Icons.arrow_forward, color: Colors.green,),
    ),
  ],);
}

Padding secondRow(String msg) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Text(msg, style: TextStyle( color: Colors.white,)
    ),
  );
}

Row firstRow() {
  return Row(children: <Widget>[
    Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Image(image: AssetImage("assets/images/logo.png"), width: 30,),
    ),
    Text("BEAMS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
  ],);
}

Widget InstructorsComplexLayoutSolution(){
  // wrap everything in a purple container
  return Container(
    margin: EdgeInsets.all(16.0),
    padding: EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.purple[900],
      border: Border.all(),
      borderRadius: BorderRadius.all(Radius.circular(3.0)),
    ),

    // column of three rows
    child: Column(

      // this makes the column height hug its content
      mainAxisSize: MainAxisSize.min,
      children: [

        // first row
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.favorite,
                color: Colors.green,
              ),
            ),
            Text(
              'BEAMS',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),

        // second row (single item)
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 0,
          ),
          child: Text('Send programmable push notifications to iOS and Android devices with delivery and open rate tracking built in.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),

        // third row
        Row(
          children: [
            Text('EXPLORE BEAMS',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(Icons.arrow_forward,
                color: Colors.green,
              ),
            ),
          ],
        ),

      ],
    ),
  );
}
