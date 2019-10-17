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

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final List<transaction> transactions = transaction.getTransactions();

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
