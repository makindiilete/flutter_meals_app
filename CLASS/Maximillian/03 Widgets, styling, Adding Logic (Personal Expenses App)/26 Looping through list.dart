/*
Our chart is going to be inside a card which will be a row containing 7 columns, each column will represent each day of the week...
On each column, we will have the totalSum spend on each day and later we will fill each column with the average amount spend on each day in relative to the total amount spent for the week, ds will be the determinant of how filled the column will be...
1)  To get the totalSum spend on each day, we need to loop through the list and first figure out if the date of the specific transactions is equals to the day of the week we are checking.
2)  We then add the total amount spend on the transaction for that day to the totalSum
*/

//chart.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Max/Widget%20&%20Styling/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart({this.recentTransactions});

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

      print("Day : ${DateFormat.E(weekDay)} - Amount : $totalSum");
      //we runs and return ds object for each item in d list, day : returns d day of d week formatted with the intl package dt returns M, T,W,T,F,S,S and 'amount' returns the total transaction performed each day
      return {"day": DateFormat.E(weekDay).subString(0,1), "amount": totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
    );
  }
}
