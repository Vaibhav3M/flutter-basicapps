import 'package:flutter/material.dart';

import '../model/transaction.dart';
import './TransactionCard.dart';



class TransactionList extends StatelessWidget {

  final List<transaction> transactions = transaction.getTransactions();


  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return TransactionCard(tx.id, tx.title, tx.amount, tx.date);
      }).toList(),
    );
  }
}
