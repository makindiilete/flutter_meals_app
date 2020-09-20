/*
Now we want to render a new screen when we click on a category, clicking on a category should take us to a new page where we see the meals available for the selected category, so we need to add a new widget to our lib folder and name it "category_meal_screen.dart"
*/

//category_item.dart
import 'package:flutter/material.dart';
import 'package:meals_app/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem({@required this.title, this.color});

  //we use ds method to switch screen
  void selectCategory(BuildContext context) {
    //We use d Navigator to navigate to the CategoryMealsScreen
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => CategoryMealsScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor, // d color of the ripple effect
      borderRadius: BorderRadius.circular(15), // d ripple effect borderRadius which must b d same as d container borderRadius
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("The Recipes")),
      body: Center(
        child: Text("The Recipe For The Category!"),
      ),
    );
  }
}
