import 'package:flutter/material.dart';

class CategoryDetailsScreen extends StatelessWidget {
//  final String id;
//  final String title;
//
//  CategoryDetailsScreen(this.id,this.title);

  static String route = '/catalogDetails';

  @override
  Widget build(BuildContext context) {
    final routArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final title = routArgs['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(child: Text(title)),
    );
  }
}
