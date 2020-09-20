import 'package:flutter/material.dart';
import 'package:meals_app/Data/dummy_data.dart';
import 'package:meals_app/WIdgets/category_item.dart';

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
