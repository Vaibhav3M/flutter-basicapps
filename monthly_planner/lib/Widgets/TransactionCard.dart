import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:monthly_planner/model/transaction.dart';

class TransactionCard extends StatelessWidget {

  transaction trans;

  TransactionCard(
      @ required this.trans);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10,
                      horizontal:15.0),
              decoration: BoxDecoration(border: Border.all(
                  color: Colors.green,
                  width: 2.0)
              ),
              child: Text(
                  '\$ ${trans.amount}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.green,
                ),
              ),
              padding: EdgeInsets.all(10),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(trans.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0
                      ) ,),
                  ),
                  Container(
                    child: Text(
                      DateFormat.yMMMd().add_E().add_jm().format(trans.date),
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey
                    ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
