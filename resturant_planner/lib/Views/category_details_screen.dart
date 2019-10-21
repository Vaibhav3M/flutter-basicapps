import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  final String id;
  final String title;

  MealsScreen(this.id,this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),

    );
  }
}
