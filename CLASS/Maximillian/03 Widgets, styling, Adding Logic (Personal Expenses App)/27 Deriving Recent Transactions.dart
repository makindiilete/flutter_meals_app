/*
Now its time to wire up our chart and replace the current chart placeholder with our chart widget..
Then we filter our list of transactions and pass to the chart widget only those transactions that happened in the previous week. So to achieve this, we will need to also loop through all the transactions inside our main.dart file but this time we will be using an alternative to 'for...loop', we will be using the 'where()' clause
1)  We add a getter to our main.dart file to dynamically generate transactions done in the last 7days
  //We use 'get' for dynamically calculated properties
  List<Transaction> get _recentTransactions {
    //we return only transactions that are younger than 7 days from now
    return _userTransactions
        .where(
            (tx) => tx.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }
*/

//main.dart
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Max/Widget%20&%20Styling/widgets/chart.dart';
import 'package:flutter_complete_guide/Max/Widget%20&%20Styling/widgets/new_transaction.dart';

import 'Max/Widget & Styling/models/transaction.dart';
import 'Max/Widget & Styling/widgets/transaction_list.dart';

//We need to change ds syntax from what we have been using to ds, to make our bottom sheet work
void main() {
  runApp(MaterialApp(
    home: ExpenseApp(),
    theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand', //General font family for our app
        //Any text we convert to 'title' using the context will use ds style
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        //d text with the 'title' property on our appBar will have ds settings
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight
                        .bold)))), //we define a color "swatch", with ds flutter will auto generate shades of ds color and split them into respective usages
  ));
}

// the root widget of our application
class ExpenseApp extends StatefulWidget {
  @override
  _ExpenseAppState createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  final List<Transaction> _userTransactions = [
//    Transaction(
//        amount: 69.00, date: DateTime.now(), id: "t1", title: "New Shoes"),
//    Transaction(
//        amount: 53.20,
//        date: DateTime.now(),
//        id: "t2",
//        title: "Weekly Groceries")
  ];

  //We use 'get' for dynamically calculated properties
  List<Transaction> get _recentTransactions {
    //we return only transactions that are younger than 7 days from now
    return _userTransactions
        .where(
            (tx) => tx.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }
  /*now we need our _answerQuestion to a title and amount from
  new_transaction.dart and add it to our transaction state thereby rendering
  the new updated list*/

  void _addNewTransaction(String txTitle, double txAmount) {
    var newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: DateTime.now());

//we update our _userTransactions state with our new transaction
    setState(() {
      _userTransactions.add(newTx);
    });
    print(newTx);
  }

//ds method opens our bottom modal sheet and the modal return our New Transaction form
  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return NewTransaction(addNewTransaction: _addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Personal Expenses"), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          // on click of the app bar icon  , we call d method which opens d bottom sheet dat returns our NewTransaction form
          onPressed: _showModalSheet,
        )
      ]),
      body: //ds widgets makes d app scrollable when there is overflow
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(
              recentTransactions: _recentTransactions,
            ),
            // we call our transaction list widget here dt renders all added transactions
            TransactionList(userTransactions: _userTransactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        // on click of the floating button, we call d method which opens d bottom sheet dat returns our NewTransaction form
        onPressed: _showModalSheet,
        child: Icon(Icons.add),
      ),
    );
  }
}

//chart.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Max/Widget%20&%20Styling/models/transaction.dart';
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
      return {"day": DateFormat.E().format(weekDay).substring(0,1), "amount": totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    //we print our list og groupedTransactionValues
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
    );
  }
}
