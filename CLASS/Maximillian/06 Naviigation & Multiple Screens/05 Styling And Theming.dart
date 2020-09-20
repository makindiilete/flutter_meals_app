/*
Now we want to adjust the overall look of our app e.g. Adding custom fonts, adding some margin between our grids..
1)  Create an assets folder > Inside add a font folder and paste the fonts attached to the module
2)  Now configure the fonts in the pubspec.yaml file as uve learnt..
3)  After configuring the font, we can now make use of it by defining our textTheme in main.dart
4)  Then inside the category_item widget, give the title text our title textTheme prop
*/

//main.dart
import 'package:flutter/material.dart';
import 'package:meals_app/categories_screen.dart';

//We need to change ds syntax from what we have been using to ds, to make our bottom sheet work
void main() => runApp(MealsApp());

class MealsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DeliMeals",
      theme: ThemeData(
        primarySwatch: Colors.pink, accentColor: Colors.amber, canvasColor: Color.fromRGBO(255, 254, 229, 1), fontFamily: 'Raleway', //General font family for our app
        //Any text we convert to 'title' using the context will use ds style
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          title: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      home: CategoriesScreen(),
    );
  }
}



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
    );
  }
}


/*
Next we will handle how to tap on an item and then navigate to a new page that show details of the tapped item
*/