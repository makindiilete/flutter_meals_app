import 'package:flutter/foundation.dart';

enum Complexity {
  Simple, //0
  Challenging, //1
  Hard //2
}

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id; //each meal need to have an id
  final List<String> categories; //each meal can belong to a list of categories
  final String title; // d meal title
  final String imageUrl; //a network image of d meal
  final List<String>
      ingredients; //a list of strings containing ingredients used for the meal
  final List<String> steps; //list of steps to create d meal
  final int duration; //how long it will take to prepare the meal
  final Complexity complexity; //how easy it is to prepare the meal
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal(
      {@required this.id,
      @required this.categories,
      @required this.title,
      @required this.imageUrl,
      @required this.ingredients,
      @required this.steps,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.isGlutenFree,
      @required this.isLactoseFree,
      @required this.isVegan,
      @required this.isVegetarian});
}
