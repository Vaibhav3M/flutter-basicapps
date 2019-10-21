import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';
import './TransactionCard.dart';

class TransactionList extends StatelessWidget {
  final Function _deleteTransaction;

  TransactionList(this._deleteTransaction);

  final List<transaction> transactions = transaction.getTransactions();

  // Using @TransactionCard widget to creat a list using ListView Builder
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      return transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No transaction yet!! ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constrain.maxHeight * 0.7,
                  child: Image.asset('lib/assets/images/waiting.png',
                      fit: BoxFit.cover),
                ),
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$ ${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_outline,
                          color: Theme.of(context).errorColor),
                      onPressed: () => _deleteTransaction(transactions[index]),
                    ),
                  ),
                );

                //return TransactionCard(transactions[index]);
              },
            );
    });
  }
}
