/*Now we are going to use our dummy data to form our category screen...

We will write the structure inside a new widget file and import it inside the category screen
*/

//category_item.dart
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;

  CategoryItem({@required this.title, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Text(title),
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
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, //each grid item will occupy total of 200px on the horizontal axis
          childAspectRatio: 1.5, //height of each grid will be (maxCrossAxisExtent * 1.5 = 300px)
          crossAxisSpacing: 20, // 20px space btw d grids on the horizontal axis
          mainAxisSpacing: 20 //20px space btw d grids on the vertical axis
      ),
      children: DUMMY_CATEGORIES
          .map((data) => CategoryItem(
        title: data.title,
        color: data.color,
      ))
          .toList(),
    );
  }
}
