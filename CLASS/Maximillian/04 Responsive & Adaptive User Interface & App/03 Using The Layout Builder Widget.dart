/*
The LayoutBuilder widget gives us access to the total size available for a widget and using its 'constraints' parameter, we can dynamically assign heights to all the widgets we wrap it with...

Inside our chart, we have 5 different widgets that makes up our chart : -
1)  Amount : - Text widget : - We give ds 15% i.e. 0.15
2)  SizedBox : - Btw d amount and the bar : - We give ds 5% i.e. 0.05
3)  Bars : - We give ds 60% i.e. 0.6
4)  SizedBox : - We give ds 5% i.e. 0.05%
5)  Days of d week : - We give this 15% i.e. 0.15%
Total : - 100%
*/

//chart_bar.dart
import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const ChartBar({this.label, this.spendingAmount, this.spendingPctOfTotal});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          //We make our amount fit into the space available
          Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                  child: Text("\$${spendingAmount.toStringAsFixed(0)}"))),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          Container(
            height: constraints.maxHeight * 0.6,
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
            height: constraints.maxHeight * 0.05,
          ),
          Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(label)))
        ],
      );
    });
  }
}
