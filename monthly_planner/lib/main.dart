import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:monthly_planner/Widgets/AddTransaction.dart';
import 'package:monthly_planner/Widgets/Chart.dart';
import 'package:monthly_planner/Widgets/TransactionList.dart';
import './model/transaction.dart';

void main(){

  //Setting orientation device wide
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown]);

      runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightGreen,
        buttonColor: Colors.white,
        errorColor: Colors.redAccent,
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
  //get current weeks transaction for chart
  List<transaction> get _weeksTransaction {
    return transaction.getTransactions().where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  // showing popup for add transaction
  void _startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bCtx) {
          return AddTransaction(_addNewTransaction);
        });
  }

  //Method to add transaction and Update state
  _addNewTransaction(String title, double amount, DateTime date) {
    //Rounding to 2 decimal places
    String tempAmount = amount.toStringAsFixed(2);
    amount = double.parse(tempAmount);

    final newTrans =
        transaction(DateTime.now().toString(), title, amount, date);

    transaction.addTransaction(newTrans);

    //updating the state
    setState(() {
      transaction.getTransactions();
    });
  }

  //method to delete transaction
  _deleteTransaction(transaction tx) {

    setState(() {
      transaction.deleteTransaction(tx);
    });
  }

  @override
  Widget build(BuildContext context) {

    AppBar appBar = AppBar(
      title: Text("Planner"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _startAddTransaction(context),
        ),
      ],
    );


    //available height for the app
    double availableHeight = MediaQuery.of(context).size.height - appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: availableHeight * 0.3,
                width: double.infinity,
                child: Chart(_weeksTransaction)
            ),
            Container(
                height: availableHeight * 0.7,
                child: TransactionList(_deleteTransaction)),
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
