import 'package:flutter/material.dart';
import 'package:meals_app/Screens/categories_screen.dart';
import 'package:meals_app/Screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  //here contains d list of all d pages we want to navigate to with the bottom tab and their title
  final List<Map<String, Object>> _pages = [
    {"page": CategoriesScreen(), "title": "Categories"},
    {"page": FavoritesScreen(), "title": "Your Favorites"}
  ];

  int _selectedPageIndex =
      0; //ds record the index of the currently selected page

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
