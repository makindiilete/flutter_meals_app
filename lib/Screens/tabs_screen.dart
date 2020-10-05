import 'package:flutter/material.dart';
import 'package:meals_app/Screens/categories_screen.dart';
import 'package:meals_app/Screens/favorites_screen.dart';
import 'package:meals_app/WIdgets/main_drawer.dart';
import 'package:meals_app/models/meal.dart';

class TabsScreen extends StatefulWidget {
  // we define a field to bind to the fav meals received from main.dart
  final List<Meal> favoriteMeals;

  // ctor to receive d fav meals from main.dart file and store it inside d field defined above
  TabsScreen({this.favoriteMeals});
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //here contains d list of all d pages we want to navigate to with the bottom tab and their title
  List<Map<String, Object>> _pages;

  int _selectedPageIndex =
      0; //ds record the index of the currently selected page

  // We initialize our pages inside the initState so we can have access to 'widget.'
  @override
  void initState() {
    _pages = [
      {"page": CategoriesScreen(), "title": "Categories"},
//    we pass d favoriteMeals list to our favorite screen
      {
        "page": FavoritesScreen(
          favoriteMeals: widget.favoriteMeals,
        ),
        "title": "Your Favorites"
      }
    ];
    super.initState();
  }

  //ds method help switch pages....
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex][
            "title"]), //go to pages list -> index of _selectedPage and pick the title
      ),
      drawer: Drawer(
        child: MainDrawer(), //ds create
      ),
      body: _pages[_selectedPageIndex][
          "page"], // go to pages list -> index of d selectedPage and pick d page to render
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage, //when u tap on any of the tabs, ds method is called
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context)
                  .primaryColor, //for d shifting effect, we need to set a background color for each tab
              icon: Icon(Icons.category),
              title: Text("Categories")),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context)
                  .primaryColor, //for d shifting effect, we need to set a background color for each tab
              icon: Icon(Icons.star),
              title: Text("Favorites"))
        ],
        backgroundColor:
            Theme.of(context).primaryColor, //background color of d navigation
        unselectedItemColor: Colors.white, //color of d unselected tab
        selectedItemColor:
            Theme.of(context).accentColor, //color of d selected tab
        currentIndex: _selectedPageIndex, // d index of d currently selected tab
//        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
