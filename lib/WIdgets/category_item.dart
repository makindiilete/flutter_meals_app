import 'package:flutter/material.dart';
import 'package:meals_app/Screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id, @required this.title, this.color});

  //we use ds method to switch screen
  void selectCategory(BuildContext context) {
    //We use d Navigator to navigate to '/category-meals' route passing our id and title as arguments the route can make use of
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,
        arguments: {"id": id, "title": title});
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
