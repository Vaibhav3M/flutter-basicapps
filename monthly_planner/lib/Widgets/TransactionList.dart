import 'package:flutter/material.dart';

import '../model/transaction.dart';
import './TransactionCard.dart';



class TransactionList extends StatelessWidget {

  final List<transaction> transactions  = transaction.getTransactions();

  // Using @TransactionCard widget to creat a list using ListView Builder
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transactions.isEmpty ?
          Column(
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
                height: 300,
                child: Image.asset('lib/assets/images/waiting.png',fit: BoxFit.cover
                ),
              ),
            ],
          )
          : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context,index) {
        return TransactionCard(transactions[index]);
      },)
    );
  }
}
