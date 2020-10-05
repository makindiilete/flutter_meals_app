import 'package:flutter/material.dart';
import 'package:meals_app/Data/dummy_data.dart';
import 'package:meals_app/Screens/categories_screen.dart';
import 'package:meals_app/Screens/category_meals_screen.dart';
import 'package:meals_app/Screens/filters_screen.dart';
import 'package:meals_app/Screens/tabs_screen.dart';

import 'Screens/meal_detail_screen.dart';
import 'models/filters.dart';
import 'models/meal.dart';

//We need to change ds syntax from what we have been using to ds, to make our bottom sheet work
void main() => runApp(MealsApp());

class MealsApp extends StatefulWidget {
  @override
  _MealsAppState createState() => _MealsAppState();
}

class _MealsAppState extends State<MealsApp> {
  // Ds field is used to represent the shape of the filters that will be passed to the main.dart file from filters_screen to update the filters and filter the meal to be returned
  Filters _filters =
      Filters(gluten: false, lactose: false, vegan: false, vegetarian: false);

  // When d app loads, we set our available meals to our dummy meals
  List<Meal> _availableMeals = DUMMY_MEALS;

  // List of meals added to your favorite meal... it will be passed to the tabScreen which contains d favorite screen
  List<Meal> _favoriteMeals = [];

  // ds method will be called inside the filters screen to update the '_filter' field above
  void _setFilters(Filters filterData) {
    setState(() {
      // When ds method is called in the filters component, we update our filters with the new filter values
      _filters = filterData;
      // Then we filter the available meals based on d filters
      _availableMeals = DUMMY_MEALS.where((meal) {
        // if we set d filter to show gluten free meals and d current meal is does not have 'isGlutenFree' in its property,
        if (_filters.gluten == true && meal.isGlutenFree == false) {
          // we filter it out, we dont return it
          return false;
        }
        // if we set d lactose to show gluten free meals and d current meal is does not have 'isGlutenFree' in its property,
        if (_filters.lactose == true && meal.isLactoseFree == false) {
          // we filter it out, we dont return it
          return false;
        }
        // if we set d vegan to show gluten free meals and d current meal is does not have 'isGlutenFree' in its property,
        if (_filters.vegan == true && meal.isVegan == false) {
          // we filter it out, we dont return it
          return false;
        }
        // if we set d vegetarian to show gluten free meals and d current meal is does not have 'isGlutenFree' in its property,
        if (_filters.vegetarian == true && meal.isVegetarian == false) {
          // we filter it out, we dont return it
          return false;
        }
        // if we have set no filters then we return true to return all meals
        return true;
      }).toList();
    });
  }

  // ds method is responsible for pushing a meal to favorite list
  void _toggleFavorite(String mealId) {
    // meals already in the array we return positive index, meals not available returns -1
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    // if we find a mean already in d favorite list, then we want to remove it on toggle
    if (existingIndex != -1) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    }
    // else if the meal with d index is not in the list, we add it on toggle
    else {
      _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
  }

  // ds method checks if d passed meal exist in the favorite list and return true and false vice versa
  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

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

//      home: CategoriesScreen(), // we comment out d home component since we want to handle this with any component defined inside our '/' route

      //defining our routes
      routes: {
        "/": (context) => TabsScreen(
            favoriteMeals:
                _favoriteMeals), //now we load our tabs screen instead of our Category screen as our default 'Home' component
//        "/category-meals": (context) => CategoryMealsScreen()
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(
              availableMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (context) => MealDetailScreen(
            toggleFavorite: _toggleFavorite,
            isMealFavorite: _isMealFavorite), //meal detail route
        //We pass the _setFilter function and the filter values to the FiltersScreen so from the filters page we can call d _setFilter function to implement new filters
        FiltersScreen.routeName: (context) =>
            FiltersScreen(saveFilters: _setFilters, filters: _filters)
      },

/*      onGenerateRoute: (settings) {
        print(settings.arguments);
        if(settings.name == "/meal-detail"){
          return ...;
        }
        else if(setting.name == "/something-else"){
          return ...;
        }
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },*/
      //unknown route will fall back here if onGenerateRoute is not provided
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}
