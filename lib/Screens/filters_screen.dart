import 'package:flutter/material.dart';
import 'package:meals_app/WIdgets/main_drawer.dart';
import 'package:meals_app/models/filters.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";

  // We defined a field as function which holds d function passed to this component from main.dart
  final Function saveFilters;
  // ds contains d filters passed to this component from main.dart
  final Filters filters;

  // we initialize the fields inside the constructor so we can receive all items passed from main.dart and can be available for usage in ds component
  FiltersScreen({@required this.saveFilters, @required this.filters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  // when d component loads, we set the value of all d fields defined above to the filters value dt we received from main.dart
  @override
  initState() {
    _glutenFree = widget.filters.gluten;
    _vegetarian = widget.filters.vegetarian;
    _vegan = widget.filters.vegan;
    _lactoseFree = widget.filters.lactose;
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentSwitchValue, Function updateValue) {
    return SwitchListTile(
      value: currentSwitchValue,
      // when we change d switch, we update the value in d setState
      onChanged: updateValue,
      subtitle: Text(description),
      title: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Filters"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.save),
//                on press of the action button, we call the Filters() constructor of the filters model, set its value to our fields from line 19 - 22 and pass it to the saveFilters method dt calls the '_setFilters()' in main.dart
                onPressed: () {
                  Filters _filters = Filters(
                      gluten: _glutenFree,
                      lactose: _lactoseFree,
                      vegan: _vegan,
                      vegetarian: _vegetarian);
                  widget.saveFilters(_filters);
                })
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
//              We have a list of all the 4 filters defined above with each filter mapped to a switch
                child: ListView(
              children: <Widget>[
                _buildSwitchListTile('Gluten-free',
                    "Only Include Gluten Free Meals", _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Lactose-free',
                    "Only Include Lactose Free Meals",
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', "Only Include Vegetarian Meals", _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', "Only Include Vegan Meals", _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
