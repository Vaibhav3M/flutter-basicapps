import 'package:flutter/material.dart';
import 'package:resturant_planner/Views/category_details_screen.dart';

class CategoryTile extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryTile(this.id, this.title, this.color);

//  void _onTileTap(BuildContext context) {
//    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
//      return MealsScreen(this.id, this.title);
//    }));
//  }

  //using named routes
    void _onTileTap(BuildContext context) {
    Navigator.of(context).pushNamed('/catalogDetails',arguments: {'id':id, 'title': title});
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _onTileTap(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          this.title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [this.color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
