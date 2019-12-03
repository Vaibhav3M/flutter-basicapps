import 'package:flutter/material.dart';

import 'package:resturant_planner/model/Meal.dart';
import 'package:resturant_planner/widgets/category_detail_tile.dart';

class CategoryDetailsScreen extends StatelessWidget {
  static String route = '/categoryDetails';

  @override
  Widget build(BuildContext context) {
    final routArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final id = routArgs['id'];
    final title = routArgs['title'];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return DetailTile(
              id:categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageURL,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
                duration: categoryMeals[index].duration,);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
