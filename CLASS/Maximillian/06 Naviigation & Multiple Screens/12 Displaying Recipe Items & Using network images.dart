/*
Now we want to create a new widget where we define the look of our meal instead of rendering just a plain text...
*/
//meal_item.dart
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {@required this.title,
        @required this.imageUrl,
        @required this.duration,
        @required this.complexity,
        @required this.affordability});
  void onSelectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectMeal,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            //we will use ds Stack widget to place d meal title ontop of the meal image
            Stack(
              children: <Widget>[
                //ClipRRect allows us to set border radius for widget that does not support border radius by default like Image
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
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}



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
                affordability: categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
