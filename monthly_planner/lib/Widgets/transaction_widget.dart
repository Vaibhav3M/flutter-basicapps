import 'package:flutter/material.dart';

class transactionCard extends StatelessWidget {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  transactionCard(@required this.id, @required this.title,
      @required this.amount, @required this.date);

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
                  '\$ $amount',
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
                    child: Text(title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0
                      ) ,),
                  ),
                  Container(
                    child: Text(date.toString(),
                    style: TextStyle(
                      fontSize: 10.0,
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
