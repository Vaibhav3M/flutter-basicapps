import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:monthly_planner/Widgets/ChartBar.dart';
import 'package:monthly_planner/model/transaction.dart';

class Chart extends StatelessWidget {
  final List<transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      var totalAmount = 0.0;
      for (int i = 0; i < recentTransactions.length; i++) {
        final currTrans = recentTransactions[i];

        if (currTrans.date.year == weekDay.year &&
            currTrans.date.month == weekDay.month &&
            currTrans.date.day == weekDay.day) {
          totalAmount += currTrans.amount;
        }
      }

      print(DateFormat.E().format(weekDay));
      print(totalAmount);
      return {"day": DateFormat.E().format(weekDay), "amount": totalAmount};
    }).reversed.toList();
  }

  double get weekTotal {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: weekTotal == 0
                  ? ChartBar(data['day'], data['amount'],
                  (data['amount'] as double))
                  : ChartBar(data['day'], data['amount'],
                      (data['amount'] as double) / weekTotal),
            );
          }).toList(),
        ),
      ),
    );
  }
}
