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
