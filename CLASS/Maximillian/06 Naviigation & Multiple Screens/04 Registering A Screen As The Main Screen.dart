/*
Now that we are working on navigation, we will have various screens but we need to register one as the main screen which is our categories screen
*/

//categories_screen
import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';
import 'package:meals_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DeliMeals"),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200, //each grid item will occupy total of 200px on the horizontal axis
            childAspectRatio: 1.5, //height of each grid will be (maxCrossAxisExtent * 1.5 = 300px)
            crossAxisSpacing: 20, // 20px space btw d grids on the horizontal axis
            mainAxisSpacing: 20 //20px space btw d grids on the vertical axis
        ),
        children: DUMMY_CATEGORIES
            .map((data) => CategoryItem(
          title: data.title,
          color: data.color,
        ))
            .toList(),
      ),
    );
  }
}


//Main.dart
import 'package:flutter/material.dart';
import 'package:meals_app/categories_screen.dart';

//We need to change ds syntax from what we have been using to ds, to make our bottom sheet work
void main() => runApp(MealsApp());

class MealsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CategoriesScreen(),
    );
  }
}
