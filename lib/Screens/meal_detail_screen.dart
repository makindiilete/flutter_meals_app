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
