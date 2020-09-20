import 'package:flutter/material.dart';
import 'package:meals_app/Screens/categories_screen.dart';
import 'package:meals_app/Screens/category_meals_screen.dart';
import 'package:meals_app/Screens/meal_detail_screen.dart';

//We need to change ds syntax from what we have been using to ds, to make our bottom sheet work
void main() => runApp(MealsApp());

class MealsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway', //General font family for our app
        //Any text we convert to 'title' using the context will use ds style
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
      ),
//      home: CategoriesScreen(),
      //defining our routes
      routes: {
        "/": (context) => CategoriesScreen(),
//        "/category-meals": (context) => CategoryMealsScreen()
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (context) =>
            MealDetailScreen() //meal detail route
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
