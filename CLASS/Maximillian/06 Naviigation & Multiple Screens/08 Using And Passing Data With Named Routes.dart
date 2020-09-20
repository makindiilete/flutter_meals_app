/*
Another way of setting up our routes is using  Named routes.. In a complex app with many routes, it might be difficult to setup our routes using the MaterialPageRoute inside a method we assign to an onTap event because that does not give us the ability to see at a glance the routes we have in our app
*/


//main.dart
import 'package:flutter/material.dart';
import 'package:meals_app/categories_screen.dart';
import 'package:meals_app/category_meals_screen.dart';

//We need to change ds syntax from what we have been using to ds, to make our bottom sheet work
void main() => runApp(MealsApp());

class MealsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway', //General font family for our app
        //Any text we convert to 'title' using the context will use ds style
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          title: TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
      home: CategoriesScreen(),
      //defining our routes
      routes: {"/category-meals": (context) => CategoryMealsScreen()},
    );
  }
}


//category_item.dart
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id, @required this.title, this.color});

  //we use ds method to switch screen
  void selectCategory(BuildContext context) {
    //We use d Navigator to navigate to '/category-meals' route passing our id and title as arguments the route can make use of
    Navigator.of(context)
        .pushNamed("/category-meals", arguments: {"id": id, "title": title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor:
      Theme.of(context).primaryColor, // d color of the ripple effect
      borderRadius: BorderRadius.circular(
          15), // d ripple effect borderRadius which must b d same as d container borderRadius
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          //we form a linear gradient and we specify d 2 colors dt forms d gradient : 70% opacity of d color we r using & d real color
            gradient: LinearGradient(
                colors: [
                  color.withOpacity(0.7),
                  color,
                ],
                begin: Alignment.topLeft, //starts d gradient from top left
                end: Alignment.bottomRight // end d gradient at bottom right
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}


//category_meals_screen.dart
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
/*  final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen({this.categoryId, this.categoryTitle});*/
  @override
  Widget build(BuildContext context) {
    // we extract d route args passd to ds screen from category_item and d args r string key and string value
    final routeArgs =
    ModalRoute.of(context).settings.arguments as Map<String, String>;

    //We using d keys to extract d title and id
    final categoryTitle = routeArgs["title"];
    final categoryId = routeArgs["id"];

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: Center(
        child: Text("The Recipe For The Category!"),
      ),
    );
  }
}
