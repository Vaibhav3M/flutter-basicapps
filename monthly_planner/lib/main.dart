import 'package:flutter/material.dart';

import 'package:monthly_planner/Widgets/AddTransaction.dart';
import 'package:monthly_planner/Widgets/TransactionList.dart';
import './model/transaction.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // showing popup for add transaction
  void _startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return AddTransaction(_addNewTransaction);
        });
  }

  //Method to add transaction and Update state
  _addNewTransaction(String title, double amount) {
    //Rounding to 2 decimal places
    String tempAmount = amount.toStringAsFixed(2);
    amount = double.parse(tempAmount);

    final newTrans =
        transaction(DateTime.now().toString(), title, amount, DateTime.now());

    transaction.addTransaction(newTrans);

    //updating the state
    setState(() {
      transaction.getTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Planner"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text("CHART !!!!"),
              ),
            ),
            TransactionList(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddTransaction(context),
      ),
    );
  }
}
