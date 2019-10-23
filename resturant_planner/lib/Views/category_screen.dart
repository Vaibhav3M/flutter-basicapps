import 'package:flutter/material.dart';

import 'package:resturant_planner/model/Category.dart';
import 'package:resturant_planner/widgets/category_tile.dart';

class CategoryScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resturant Items"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GridView(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: Category.DUMMY_CATEGORIES
              .map((catdata) => CategoryTile(
                    catdata.id,
                    catdata.title,
                    catdata.color,

                  ))
              .toList(),
        ),
      ),
    );
  }
}
