/*
Now we want to start by building our categories screen.
DIFFERENCE BETWEEN SCREEN AND WIDGET
There are no hard rules to this, every widget can be a screen and every screen can be a widget but basically any widget that contains the Scaffold() widget is regarded as screen since we have basic screen settings like AppBar, body etc inside the scaffold widget... Other terms like 'page, routes' can also be used instead of screen.

1)  Add a new file 'categories_screen.dart' ==> oue categories grid view
2)  Add a model file 'models/category.dart'
3)  Add a dummy data file 'dummy_data.dart'
*/

//categories_screen.dart
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, //each grid item will occupy total of 200px on the horizontal axis
          childAspectRatio: 1.5, //height of each grid will be (maxCrossAxisExtent * 1.5 = 300px)
          crossAxisSpacing: 20, // 20px space btw d grids on the horizontal axis
          mainAxisSpacing: 20 //20px space btw d grids on the vertical axis
      ),
      children: <Widget>[],
    );
  }
}



//category.dart
import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color; //background color... ds is not a required field so we set a default value incase no value is passed

  //A const constructor which means after init, d value of each field cannot be changed
  const Category({@required this.id, @required this.title, this.color = Colors.orange});
}


//dummy_data.dart
import 'package:flutter/material.dart';

import 'models/category.dart';

const DUMMY_CATEGORIES =
//a const list/array which means d values here cannot be changed after init
const [
  Category(
    id: 'c1',
    title: 'Italian',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Quick & Easy',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Hamburgers',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'German',
    color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: 'Light & Lovely',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Exotic',
    color: Colors.green,
  ),
  Category(
    id: 'c7',
    title: 'Breakfast',
    color: Colors.lightBlue,
  ),
  Category(
    id: 'c8',
    title: 'Asian',
    color: Colors.lightGreen,
  ),
  Category(
    id: 'c9',
    title: 'French',
    color: Colors.pink,
  ),
  Category(
    id: 'c10',
    title: 'Summer',
    color: Colors.teal,
  ),
];
