/* 
The widgets in the last lesson only took one child. When creating a layout, though, it is often necessary to arrange multiple widgets together. We will see how to do that using rows, columns, and stacks.
 */

//Rows : - Rows are easy. Just pass in a list of widgets to Row's children parameter.

Widget myLayoutWidget() {
  return Row(
    children: <Widget>[
      Icon(
        Icons.sentiment_very_dissatisfied,
        size: 50.0,
        color: Colors.red,
      ),
      Icon(
        Icons.sentiment_very_dissatisfied,
        size: 50.0,
        color: Colors.red,
      ),
      Icon(
        Icons.sentiment_very_dissatisfied,
        size: 50.0,
        color: Colors.red,
      ),
      Icon(
        Icons.sentiment_very_dissatisfied,
        size: 50.0,
        color: Colors.red,
      )
    ],
  );
}

//Columns : - Now replace Row with Column and you get
Widget myLayoutWidget() {
  return Column(
    children: <Widget>[
      Icon(
        Icons.sentiment_very_dissatisfied,
        size: 50.0,
        color: Colors.red,
      ),
      Icon(
        Icons.sentiment_very_dissatisfied,
        size: 50.0,
        color: Colors.red,
      ),
      Icon(
        Icons.sentiment_very_dissatisfied,
        size: 50.0,
        color: Colors.red,
      ),
      Icon(
        Icons.sentiment_very_dissatisfied,
        size: 50.0,
        color: Colors.red,
      )
    ],
  );
}

//SPACE THE ICONS EVENLY ACROSS THE SCREEN i.e. justifyContent : center and alignItems: Center
/* The Expanded widget allows a widget to fill the available space, horizontally if it is in a row, or vertically if it is in a column. You can use the flex property with multiple widgets to give them weights. Here the green Container takes 70% of the width and the yellow Container takes 30% of the width. */
//Space evenly vertically
Widget myLayoutWidget() {
  return Column(
    children: [
      Expanded(
        child: Icon(
          Icons.sentiment_very_dissatisfied,
          size: 50.0,
          color: Colors.red,
        ),
      ),
      Expanded(
        child: Icon(
          Icons.sentiment_very_dissatisfied,
          size: 50.0,
          color: Colors.red,
        ),
      ),
      Expanded(
        child: Icon(
          Icons.sentiment_very_dissatisfied,
          size: 50.0,
          color: Colors.red,
        ),
      ),
      Expanded(
        child: Icon(
          Icons.sentiment_very_dissatisfied,
          size: 50.0,
          color: Colors.red,
        ),
      ),
    ],
  );
}

//Space evenly horizontally
Widget myLayoutWidget() {
  return Row(
    children: [
      Expanded(
        child: Icon(
          Icons.sentiment_very_dissatisfied,
          size: 50.0,
          color: Colors.red,
        ),
      ),
      Expanded(
        child: Icon(
          Icons.sentiment_very_dissatisfied,
          size: 50.0,
          color: Colors.red,
        ),
      ),
      Expanded(
        child: Icon(
          Icons.sentiment_very_dissatisfied,
          size: 50.0,
          color: Colors.red,
        ),
      ),
      Expanded(
        child: Icon(
          Icons.sentiment_very_dissatisfied,
          size: 50.0,
          color: Colors.red,
        ),
      ),
    ],
  );
}
