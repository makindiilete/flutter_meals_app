/*
Now we want to add a new screen where we will navigate to from the meals screen and the details screen will show the list of recipe for rhe selected meal
*/

//main.dart
import 'package:flutter/material.dart';
import 'package:meals_app/Screens/categories_screen.dart';
import 'package:meals_app/Screens/category_meals_screen.dart';
import 'package:meals_app/Screens/meal_detail_screen.dart';

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
//      home: CategoriesScreen(),
      //defining our routes
      routes: {
        "/": (context) => CategoriesScreen(),
//        "/category-meals": (context) => CategoryMealsScreen()
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen() //meal detail route
      },
    );
  }
}


//meal_detail_screen.dart
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-details";

  @override
  Widget build(BuildContext context) {
    // we extract d route args passed to ds screen from category_meals_screen and d args is a string 'id'
    final mealId = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("$mealId"),
      ),
      body: Center(
        child: Text("The Meal - $mealId"),
      ),
    );
  }
}


//Tapping on a meal item in the category_meals_screen sud take u to the meal details screen

//meal_item.dart
import 'package:flutter/material.dart';
import 'package:meals_app/Screens/meal_detail_screen.dart';
import 'package:meals_app/models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {@required this.id,
        @required this.title,
        @required this.imageUrl,
        @required this.duration,
        @required this.complexity,
        @required this.affordability});

  //Ds method is used to extract our Complexity enum values
  String complexityText() {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknown";
    }
  }

  //Ds method is used to extract our Affordability enum values
  String affordabilityText() {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "Unknown";
    }
  }

  //on tap of a meal, ds method is called which push d meal detail screen ontop of the meals screen and it also send the tapped meal id which will be used to fetch d meal details in d meal details screen
  void onSelectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            //we will use ds Stack widget to place d meal title ontop of the meal image
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width:
                    double.infinity, //take all d available width in d card
                    fit: BoxFit.cover,
                  ),
                ),
                //we wrap our text inside d positioned widget so we can position where we want our text to stay
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text("$duration min")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText())
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText())
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


//U need to pass the meal id now from the categories_meal_screen to the meal_item widget so from there we can pass it to the meal_detail screen

//category_meals_screen.dart

import 'package:flutter/material.dart';
import 'package:meals_app/Data/dummy_data.dart';
import 'package:meals_app/WIdgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = "/category-meals";
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
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList(); //filter our dummy meals for all meals with d categoryId property in line 18

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
              id: categoryMeals[index].id,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
