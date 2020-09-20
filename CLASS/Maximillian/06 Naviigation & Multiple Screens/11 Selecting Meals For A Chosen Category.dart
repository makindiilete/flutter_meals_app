/*
Now that we have our model and data in place, when we tap on a category, we want to render all meals that belong to that category using the 'categories' field inside our model which contain list of category ids
*/

//category_meals_screen.dart

import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

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
            return Text(categoryMeals[index].title); //display d meal title in a text widget
          },
          itemCount: categoryMeals.length,
        ));
  }
}
