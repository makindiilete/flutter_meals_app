/* 
In this video we are going to examine how to combine widgets together to render something meaningful on the screen
 */

//playground : - https://prnt.sc/u4mz5c
import 'package:flutter/material.dart';

class Playground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
          children: <Widget>[
            Card(
              child: Text("CHART"),
              elevation: 5,
            ),
            Card(
              child: Text("LIST OF TX!"),
            )
          ],
        ),
      ),
    );
  }
}

/* 
The code above gives a 2 cards on the screen, the second card is below the first due to the help of the column widget that aligns objects vertically on the screen, so USE THE COLUMN WIDGET WHEN U HAVE MULTIPLE ITEMS U WANT TO RENDER ON THE SCREEN IN A VERTICAL DIMENSION

As we have seen in the attached screenshots, our cards are small because by default a card takes the width of its child and we have text inside the cards and also we know a text cannot grow more than the characters inside of it, the question now is : - 
HOW DO WE INCREASE THE SIZE OF OUR CARDS?
We definitely cannot use the text widget bcos the text size depends on the width of his parent and the card also rely on the width of its child so we have two options : - 
1.  Wrap the text widget with a container and specify the width we need, a container gives us the room to define the size we want with other custom abilities... So the card's size will no longer depend on the width of the text bcos its immediate child will now be the container which we have set defined its width
 */

import 'package:flutter/material.dart';

class Playground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
          children: <Widget>[
            Card(
              color: Colors.blue,
              child: Container(
                  // width: 100,
                  width: double
                      .infinity, //ds takes as much space as d widget can get
                  child: Text("CHART")),
              elevation: 5,
            ),
            Card(
              child: Text("LIST OF TX!"),
            )
          ],
        ),
      ),
    );
  }
}


//METHOD 2 : - Another way of doing this is to wrap the card widget itself in a container and give the container a defined width, so this way, the card will be forced to take the width of its parent 'container'
import 'package:flutter/material.dart';

class Playground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text("CHART"),
                elevation: 5,
              ),
            ),
            Card(
              child: Text("LIST OF TX!"),
            )
          ],
        ),
      ),
    );
  }
}



/* 
NOTE : - Do not try to learn all the widgets by hearts because they are too much for you to learn all by heart, instead learn by doing, learn by practice, try many combinations and see what you get. */

