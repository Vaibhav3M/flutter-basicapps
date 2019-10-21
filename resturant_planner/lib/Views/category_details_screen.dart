import 'package:flutter/material.dart';


import 'package:resturant_planner/model/Meal.dart';

class CategoryDetailsScreen extends StatelessWidget {
//  final String id;
//  final String title;
//
//  CategoryDetailsScreen(this.id,this.title);

  static String route = '/catalogDetails';

  @override
  Widget build(BuildContext context) {
    final routArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final id = routArgs['id'];
    final title = routArgs['title'];

    final categoryMeals = DUMMY_MEALS.where((meal){

      return meal.categories.contains(id);
    }).toList();


    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(itemBuilder: (ctx,index){

          return Text(categoryMeals[index].title);
      },
      itemCount: categoryMeals.length,

      ),
    );
  }
}
