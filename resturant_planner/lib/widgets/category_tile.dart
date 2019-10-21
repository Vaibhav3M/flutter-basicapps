import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {

 final String title;
 final Color color;

 CategoryTile(this.title,this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(this.title),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [this.color.withOpacity(0.7),
          color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
