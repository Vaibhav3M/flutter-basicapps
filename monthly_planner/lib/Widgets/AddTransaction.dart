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

  //method to on click of add transaction or done button
  void submitButtonAction(){

    if(titleFieldController.text.isEmpty || double.parse(amountFiledController.text) <=0){
      return;
    }

    _addNewTransaction(titleFieldController.text,
        double.parse(amountFiledController.text));
    titleFieldController.clear();
    amountFiledController.clear();

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
                    onSubmitted: (_) => submitButtonAction(),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                    controller: amountFiledController,
                    keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                    onSubmitted: (_) => submitButtonAction(),
                  ),
                  FlatButton(
                    child: Text(
                      "Add Transaction",
                      style: TextStyle(color: Colors.purple),
                    ),
                    onPressed: submitButtonAction,
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
