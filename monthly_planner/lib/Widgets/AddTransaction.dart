import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  final Function _addNewTransaction;

  AddTransaction(this._addNewTransaction);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final titleFieldController = TextEditingController();

  final amountFiledController = TextEditingController();

  DateTime _pickedDate;

  //method on click of add transaction
  void _submitButtonAction() {
    if (titleFieldController.text.isEmpty ||
        double.parse(amountFiledController.text) <= 0 ||
        _pickedDate == null) {
      return;
    }

    widget._addNewTransaction(titleFieldController.text,
        double.parse(amountFiledController.text), _pickedDate);

    Navigator.of(context).pop();
  }

  //method to show date picker
  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((selectedDate) {
      if (selectedDate == null) {
        return;
      }

      setState(() {
        _pickedDate = selectedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              left: 10,
              top: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: titleFieldController,
                onSubmitted: (_) => _submitButtonAction(),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: amountFiledController,
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: true),
                onSubmitted: (_) => _submitButtonAction(),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Flexible(
                        fit: FlexFit.tight,
                        child: Text("Picked date : " +
                            (_pickedDate == null
                                ? ""
                                : DateFormat.yMd().format(_pickedDate)))),
                    Platform.isIOS ? CupertinoButton(
                      child: Text(
                        "Choose Date",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: _showDatePicker,
                    ) :FlatButton(
                      child: Text(
                        "Choose Date",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: _showDatePicker,
                    ),
                  ],
                ),
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text(
                  "Add Transaction",
                  style: TextStyle(color: Theme.of(context).buttonColor),
                ),
                onPressed: _submitButtonAction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
