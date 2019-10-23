import 'package:flutter/material.dart';

class CategoryFullDetailScreen extends StatelessWidget {

  static String route = '/categoryFullDetails';

  @override
  Widget build(BuildContext context) {

    final routArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final String itemId = routArgs['id'];

    return Scaffold(
      appBar: AppBar(

      ),
      body: Text(itemId),
    );
  }
}
