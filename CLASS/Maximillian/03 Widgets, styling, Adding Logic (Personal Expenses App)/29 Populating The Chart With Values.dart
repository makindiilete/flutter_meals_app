/*
Now instead of returning a text inside our chart widget, we will return our chart_bar widget.
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
    });
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
      child: Row(
        children: groupedTransactionValues.map((data) {
          return Expanded(
              child: Container(
                  padding: EdgeInsets.all(10),
                  child: ChartBar(
                    label: data['day'],
                    spendingAmount: data['amount'],
                    //if there r not transaction, we set spending % to zero, else we divide the amount by totalSpending to get the percentage.
                    spendingPctOfTotal: totalSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / totalSpending,
                  )));
        }).toList(),
      ),
    );
  }
}
