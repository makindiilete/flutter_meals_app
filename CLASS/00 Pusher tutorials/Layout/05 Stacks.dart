/* The Stack widget lays out its children like a stack of pancakes. You set it up like the Row and Column widgets. Whichever child comes first is the one on the bottom. */

Widget myLayoutWidget() {
  return Stack(
    children: [
      Icon(
        Icons.account_circle,
        size: 200,
      ),
      Icon(
        Icons.account_circle,
        size: 150,
        color: Colors.amber,
      ),
      Icon(
        Icons.account_circle,
        size: 100,
        color: Colors.green,
      ),
      Icon(
        Icons.account_circle,
        size: 50,
        color: Colors.red,
      )
    ],
  );
}

/* A more likely scenario is to use a stack to write text on an image. Let's take this image

Create an images folder in the root of your project and copy the sheep.jpg file into it.
Register images as an assets folder in your pubspec.yaml file.
 */

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
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
