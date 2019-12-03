import 'package:flutter/material.dart';

import '../model/Meal.dart';

class CategoryFullDetailScreen extends StatelessWidget {
  static String route = '/categoryFullDetails';

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String itemId = routArgs['id'];

    final Meal currentMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.id == itemId);

    Widget titleBuilder(context, title) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget buildContainer(width,height,child) {
      return Container(
        height: height,
        width: width,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(currentMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                currentMeal.imageURL,
                fit: BoxFit.cover,
              ),
            ),
            titleBuilder(context, 'Ingredients'),
            buildContainer(200.0,100.0,
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(currentMeal.ingredients[index]),
                  ),
                  color: Colors.amber,
                ),
                itemCount: currentMeal.ingredients.length,
              ),
            ),
            titleBuilder(context, 'Steps'),
            buildContainer(400.0,300.0,
              ListView.builder(
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text('${index +1}'),
                  ),
                  title: Text(
                    currentMeal.steps[index],
                  ),
                ),
                itemCount: currentMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
