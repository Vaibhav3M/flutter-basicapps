import 'package:flutter/material.dart';

import 'package:monthly_planner/model/transaction.dart';
import 'package:monthly_planner/Widgets/transaction_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<transaction> transactions = [
    transaction("1", "Grocery", 34.0, DateTime.now()),
    transaction("2", "Mobile bill", 50.0, DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Planner"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text("CHART !!!!"),
            ),
          ),
          Column(
            children: transactions.map((tx) {
              return transactionCard(tx.id, tx.title, tx.amount, tx.date);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
