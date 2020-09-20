/*
When we click on a category on the category screen, we want to pass details of the selected category like the id and the title to the next screen we navigates to which is the "category_meals_screen.dart".. We can do this via constructor
*/

//category_meals_screen.dart
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen({this.categoryId, this.categoryTitle});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: Center(
        child: Text("The Recipe For The Category!"),
      ),
    );
  }
}


//category_item.dart
import 'package:flutter/material.dart';
import 'package:meals_app/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem({this.id, @required this.title, this.color});

  //we use ds method to switch screen
  void selectCategory(BuildContext context) {
    //We use d Navigator to navigate to the CategoryMealsScreen passing d category title & id
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => CategoryMealsScreen(
          categoryId: id,
          categoryTitle: title,
        )));
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


//categories_screen.dart
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
        padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent:
            200, //each grid item will occupy total of 200px on the horizontal axis
            childAspectRatio:
            1.5, //height of each grid will be (maxCrossAxisExtent * 1.5 = 300px)
            crossAxisSpacing:
            20, // 20px space btw d grids on the horizontal axis
            mainAxisSpacing: 20 //20px space btw d grids on the vertical axis
        ),
        children: DUMMY_CATEGORIES
            .map((data) => CategoryItem(
          id: data.id,
          title: data.title,
          color: data.color,
        ))
            .toList(),
      ),
    );
  }
}
