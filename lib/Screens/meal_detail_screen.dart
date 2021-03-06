import 'package:flutter/material.dart';
import 'package:meals_app/Data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-details";
  final Function toggleFavorite;
  final Function isMealFavorite;

  MealDetailScreen({this.toggleFavorite, this.isMealFavorite});

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    // we extract d route args passed to ds screen from category_meals_screen and d args is a string 'id'
    final mealId = ModalRoute.of(context).settings.arguments as String;

    //We loop tru selectedMeal and find d first meal dt match d mealId
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            buildSectionTitle(context, "Ingredients"),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("# ${index + 1}"),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider()
                ],
              ),
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // on tap of the floating action button to add or remove a meal from or to favorite meals list
        onPressed: () => toggleFavorite(
            mealId), // we pass the id of the meal we are currently viewing its details to the screen we are poping to which is the 'meal_item.dart'
        child:
            // using the isMealFavorite() method, we are able to know if a meal is in the favorite list or not and then we render different icons respectively
            Icon(isMealFavorite(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
