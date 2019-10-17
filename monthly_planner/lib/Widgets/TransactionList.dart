import 'package:flutter/material.dart';

import '../model/transaction.dart';
import './TransactionCard.dart';



class TransactionList extends StatelessWidget {

  final List<transaction> transactions = transaction.getTransactions();

  // Using @TransactionCard widget to creat a list using ListView Builder
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context,index) {
        return TransactionCard(transactions[index]);
      },)
    );
  }
}
