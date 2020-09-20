/* 
1. Create an assets/images folder
This should be located in the root of your project, in the same folder as your pubspec.yaml file.

2. Add your image to the new folder
You can just copy your image into assets/images. The relative path of lake.jpg, for example, would be assets/images/lake.jpg.

3. Register the assets folder in pubspec.yaml
Open the pubspec.yaml file that is in the root of your project.
Add an assets subsection to the flutter section like this:

flutter:
  assets:
    - assets/images/

4. Use the image in code
Get the asset in an Image widget with    
Image(
          image: AssetImage(
              'assets/images/3cc7762830fb5c76d71511a4c0bcc5a8.jpg')),
 */

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
          title: Text("Building layouts"),
        ),
        body: Image(
            image: AssetImage(
                'assets/images/3cc7762830fb5c76d71511a4c0bcc5a8.jpg')),
      ),
    );
  }
}

//IMAGE WITH A TEXT
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
          title: Text("Building layouts"),
        ),
        body: myLayoutWidget(),
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
            color: Color(0xfff3bb89),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
