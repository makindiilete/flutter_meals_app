import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/meal_item.dart';
import 'package:meals_app/models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  // We use d availableMeals we received from main.dart file
  final List<Meal> availableMeals;

  // we init it inside the constructor so we can access wat is sent from main.dart
  CategoryMealsScreen({@required this.availableMeals});

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;
  bool loadedInitData =
      false; // we use ds to define if all data needed by d component has been loaded

  // we use ds lifecycle since this component depends on some dependencies that is using 'context' and dt is not loved by initState() above
  @override
  void didChangeDependencies() {
    // we only want ds to run once when ds component is rendered and every time the data it uses is updated so that when we remove a data using the _removeMeal(), it will not override it by loading all d data again bcos ds method get called every time d data ds component depends on changes
    if (!loadedInitData) {
      // we extract d route args passd to ds screen from category_item and d args r string key and string value
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;

      //We using d keys to extract d title and id
      categoryTitle = routeArgs["title"];
      final categoryId = routeArgs["id"];
      categoryMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList(); //filter our dummy meals for all meals with d categoryId property in line 18

      // we set ds to true to indicate that all data has been loaded
      loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  //When d removeItem method is called, we update the state to remove the meal with the passed id
  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              removeItem:
                  _removeMeal, // a function prop to remove a particular meal
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
