import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String day;
  final double daySpendingAmount;
  final double percentageSpending;

  ChartBar(this.day,this.daySpendingAmount,this.percentageSpending);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(

            child: Text('\$ ${daySpendingAmount.toStringAsFixed(0)}')
        ),

        SizedBox(
          height: 4,
        ),

        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              SizedBox(
                height: 60,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ),
              FractionallySizedBox(
                heightFactor: percentageSpending,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            ],
          ),
        ),

        SizedBox(
          height: 4,
        ),

        Text(day),
      ],

    );
  }
}
