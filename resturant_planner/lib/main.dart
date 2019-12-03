import 'package:flutter/material.dart';


import 'package:resturant_planner/Views/category_screen.dart';
import 'package:resturant_planner/Views/category_details_screen.dart';
import 'package:resturant_planner/Views/category_fulldetail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      home: CategoryScreen(),
      routes: {
        CategoryDetailsScreen.route : (ctx) => CategoryDetailsScreen(),
        CategoryFullDetailScreen.route : (ctx) => CategoryFullDetailScreen(),
      },
//      onGenerateRoute: (settings){
//        //this method is called if no named route is found
//        // we get a parameter for which has all the info
//        // it must return route to a defined screen
//
////        print(settings);
////       return MaterialPageRoute(builder: (ctx) => CategoryScreen());
//
//      },
//      onUnknownRoute: (settings){
//        // reached when all other route build measures fail
//
//       // return MaterialPageRoute(builder: (ctx) => CategoryScreen());
//      },
    );
  }
}

