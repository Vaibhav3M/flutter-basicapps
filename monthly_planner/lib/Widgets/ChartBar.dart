import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String day;
  final double daySpendingAmount;
  final double percentageSpending;

  ChartBar(this.day, this.daySpendingAmount, this.percentageSpending);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      return Column(
        children: <Widget>[
          Container(
            height: constrain.maxHeight * 0.15,
            child: FittedBox(

                child: Text('\$ ${daySpendingAmount.toStringAsFixed(0)}')
            ),
          ),

          SizedBox(
            height: constrain.maxHeight * 0.05,
          ),

          Container(
            height: constrain.maxHeight * 0.6,
            width: 12,
            child: Stack(
              children: <Widget>[
                Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.green,
                        // borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                FractionallySizedBox(
                  heightFactor: 1 - percentageSpending,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      // borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: constrain.maxHeight * 0.05,
          ),

          Container(
            height: constrain.maxHeight * 0.15,
            child: FittedBox(
                child: Text(day)),
          ),
        ],

      );
    });
  }
}
