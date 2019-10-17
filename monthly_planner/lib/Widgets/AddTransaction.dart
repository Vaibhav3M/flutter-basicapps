import 'package:flutter/material.dart';


import 'package:monthly_planner/model/transaction.dart';
import './TransactionList.dart';

class AddTransaction extends StatefulWidget {
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {

  //Controllers for textfiled
  final titleFieldController = TextEditingController();

  final amountFiledController = TextEditingController();

  //Method to add transaction and Update state
  _addNewTransaction(String title, double amount) {
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
    return Column(
      children: <Widget>[
        Container(
          child: Card(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                    controller: titleFieldController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                    controller: amountFiledController,
                  ),
                  FlatButton(
                    child: Text(
                      "Add Transaction",
                      style: TextStyle(color: Colors.purple),
                    ),
                    onPressed: () {
                      _addNewTransaction(titleFieldController.text,
                          double.parse(amountFiledController.text));
                      titleFieldController.clear();
                      amountFiledController.clear();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          child: TransactionList(),
        )
      ],
    );
  }
}
