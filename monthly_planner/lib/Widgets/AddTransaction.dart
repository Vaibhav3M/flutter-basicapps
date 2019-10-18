import 'package:flutter/material.dart';


class AddTransaction extends StatefulWidget {

  final Function _addNewTransaction;

  AddTransaction(this._addNewTransaction);

  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {

  final titleFieldController = TextEditingController();

  final amountFiledController = TextEditingController();

  void _submitButtonAction(){

    if(titleFieldController.text.isEmpty || double.parse(amountFiledController.text) <=0){
      return;
    }

    widget._addNewTransaction(titleFieldController.text,
        double.parse(amountFiledController.text));

    Navigator.of(context).pop();
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
                    onSubmitted: (_) => _submitButtonAction(),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                    controller: amountFiledController,
                    keyboardType: TextInputType.numberWithOptions(signed: false, decimal: true),
                    onSubmitted: (_) => _submitButtonAction(),
                  ),
                  FlatButton(
                    child: Text(
                      "Add Transaction",
                      style: TextStyle(color: Colors.purple),
                    ),
                    onPressed: _submitButtonAction,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
