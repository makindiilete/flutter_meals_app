/*
Now we want to map our groupedTransactions inside chart.dart to a widget so we create a total of 7 widgets for all transactions. This widget will be a bar... So we create a new widget file for this 'chart_bar.dart'
*/

//chart_bar.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar({this.label, this.spendingAmount, this.spendingPctOfTotal});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("\$${spendingAmount.toStringAsFixed(0)}"),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10)),
              ),
              //ds will create a box dat will be sized as a fraction of the parent container which is d container with height of 60 on lne 18 where ds one is nested.. We pass to it our spendingPctOfTotal which is going to range from 0 - 1 (0% - 100%)
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                //we giv it a container where we will be able to construct the bar dt will stay on top of d one online 23
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
