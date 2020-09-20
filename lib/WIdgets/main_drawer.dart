import 'package:flutter/material.dart';
import 'package:meals_app/Screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tabHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap:
          tabHandler, //on tap of the sidebar links, d handler passed to ds builder is called
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          //ds create a rectangle box ontop of d appbar where we can put the app name, logged in username etc
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),

          //list tiles for available options
          buildListTile(
              "Meals",
              Icons.restaurant,
              () => Navigator.of(context).pushNamed(
                  '/')), // ds function is passed to the builder method to navigate to the homepage
          buildListTile(
              "Filters",
              Icons.settings,
              () => Navigator.of(context).pushNamed(FiltersScreen
                  .routeName)), // ds function is passed to the builder method to navigate to the filters screen
        ],
      ),
    );
  }
}
