/* 
So you already know that everything in the Flutter UI is a widget. They're not only structural elements like text and buttons. Layout elements like padding and rows are also widgets. First let's take a look at some of the most common layout widgets, and later we will see how to combine them into more complex layouts.
 */

/* PADDING */

//Padding  ; - Now to add padding, wrap the Text widget with a Padding widget. In Android Studio this can be accomplished by placing your cursor on the widget and pressing Option+Enter (or Alt+Enter in Windows/Linux).

//8.0px Padding on all sides
Widget myLayoutWidget() {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Text("Hello world!"),
  );
}

//Different paddings for each sides
Widget myLayoutWidget() {
  return Padding(
    // padding: const EdgeInsets.all(8.0),
    padding: const EdgeInsets.only(
        top: 20.0, bottom: 20.0, left: 10.0, right: 10.0), //
    child: Text("Hello world!"),
  );
}

/* ALIGNMENT */
//Alignment : - To center a widget, the concept is the same as it was for padding. This time you just wrap your widget with a Center widget.
Widget myLayoutWidget() {
  return Center(child: Text("Hello world!"));
}

//Alignment with 30px text font size
Widget myLayoutWidget() {
  return Center(
      child: Text(
    "Hello world!",
    style: TextStyle(fontSize: 30.0),
  ));
}

//Align Widget
Widget myLayoutWidget() {
  return Column(
    children: <Widget>[
      handleTopLeftAlignment(),
      handleTopCenterAlignment(),
      handleTopRightAlignment()
    ],
  );
}

Align handleTopLeftAlignment() {
  return Align(
      alignment: Alignment.topLeft,
      child: Text(
        "Hello world!",
        style: TextStyle(fontSize: 18),
      ));
}

Align handleTopCenterAlignment() {
  return Align(
      alignment: Alignment.topCenter,
      child: Text(
        "Hello world!",
        style: TextStyle(fontSize: 18),
      ));
}

Align handleTopRightAlignment() {
  return Align(
      alignment: Alignment.topRight,
      child: Text(
        "Hello world!",
        style: TextStyle(fontSize: 18),
      ));
}

Align handleCenterLeft() {
  return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Hello world!",
        style: TextStyle(fontSize: 18),
      ));
}

Align handleCenter() {
  return Align(
      alignment: Alignment.center,
      child: Text(
        "Hello world!",
        style: TextStyle(fontSize: 18),
      ));
}

Align handleCenterRight() {
  return Align(
      alignment: Alignment.centerRight,
      child: Text(
        "Hello world!",
        style: TextStyle(fontSize: 18),
      ));
}

Align bottomLeft() {
  return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        "Hello world!",
        style: TextStyle(fontSize: 18),
      ));
}

Align bottomCenter() {
  return Align(
      alignment: Alignment.bottomCenter,
      child: Text(
        "Hello world!",
        style: TextStyle(fontSize: 18),
      ));
}

Align bottomRight() {
  return Align(
      alignment: Alignment.bottomRight,
      child: Text(
        "Hello world!",
        style: TextStyle(fontSize: 18),
      ));
}

/* CONTAINER */
Widget myLayoutWidget() {
  return Center(
    child: Container(
      margin: EdgeInsets.all(30),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      width: 200,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: Colors.blueAccent),
          color: Colors.orange),
      child: Text(
        "Hello Word!",
        style: TextStyle(fontSize: 30),
      ),
    ),
  );
}
