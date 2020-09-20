/*
We want to improve some stuffs on our chart..
1)  Currently if we enter a very big number,though we shrink it to fit but then our bars are no longer aligned, the bar on which the large amount is place jumped up a bit bcos the text size reduced... ==> Wrapping our FittedBox that house our amount in a container and given the container a height of 20px will fix d issue
2)  We can re-arrange our week days so that today appears on the far right ==> We can call the 'reversed()' on our generated list to reverse the order
*/

//chart.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Max/Widget%20&%20Styling/models/transaction.dart';
import 'package:flutter_complete_guide/Max/Widget%20&%20Styling/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart({this.recentTransactions});

  //We use 'get' for dynamically calculated properties
  List<Map<String, Object>> get groupedTransactionValues {
    //We generate list of 7 items
    return List.generate(7, (index) {
      //we are going to have index 0 - 6, to get d current day, we subtract d index as days from DateTime.now()
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      //We loop through d list of our recent transactions
      for (var i = 0; i < recentTransactions.length; i++) {
        //check if a transaction happens on a particular day of the week
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          //Add the total amount of transaction that happens each day
          totalSum += recentTransactions[i]
              .amount; // recentTransaction[i].amount + totalSum = totalSum
        }
      }

      //we runs and return ds object for each item in d list, day : returns d day of d week formatted with the intl package dt returns M, T,W,T,F,S,S and 'amount' returns the total transaction performed each day
      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalSum
      };
    })
        .reversed
        .toList(); //ds reverse our list so that we have today at the end
  }

  //ds returns d total amount we have spent by adding up all the amount from our groupedTransactionValues list.. ds is like the reduce() in javascript array
  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (sum, item) {
      //each amount is taken and added to the initial 'sum' which will is 0.0 by default
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: groupedTransactionValues.map((data) {
            return Expanded(
                child: ChartBar(
                  label: data['day'],
                  spendingAmount: data['amount'],
                  //if there r not transaction, we set spending % to zero, else we divide the amount by totalSpending to get the percentage.
                  spendingPctOfTotal: totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending,
                ));
          }).toList(),
        ),
      ),
    );
  }
}




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
        //We make our amount fit into the space available
        Container(
            height: 20,
            child: FittedBox(
                child: Text("\$${spendingAmount.toStringAsFixed(0)}"))),
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
