/*
Now we have another issue, our landscape looks good but this affected the portrait mode because we didnt specifically apply those changes to take effect only on landscape mode.. This we will try to fix in this video
*/

//main.dart
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Max/Widget%20&%20Styling/widgets/chart.dart';
import 'package:flutter_complete_guide/Max/Widget%20&%20Styling/widgets/new_transaction.dart';

import 'Max/Widget & Styling/models/transaction.dart';
import 'Max/Widget & Styling/widgets/transaction_list.dart';

//We need to change ds syntax from what we have been using to ds, to make our bottom sheet work
void main() {
  //ds lock our app to portrait mode
//  SystemChrome.setPreferredOrientations(
//      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
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
              fontWeight: FontWeight.bold),
          button: TextStyle(color: Colors.white),
        ),

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
//        amount: 69.00,
//        date: DateTime.now().subtract(Duration(days: 1)),
//        id: "t1",
//        title: "New Shoes"),
//    Transaction(
//        amount: 51.20,
//        date: DateTime.now().subtract(Duration(days: 3)),
//        id: "t2",
//        title: "Weekly Groceries")
  ];

  bool _showChart = false;
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

  void _addNewTransaction(String txTitle, double txAmount,
      DateTime chosenDate) // now we also receive our chosen Date
  {
    var newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmount,
        date: chosenDate); //we set the transaction date to our chosen date

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

  //ds function remove a selected transaction from d list
  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation ==
        Orientation
            .landscape; //ds will be true if we are on landscape mode and base on ds, we can render different content
    final appBar = AppBar(title: Text("Personal Expenses"), actions: <Widget>[
      IconButton(
        icon: Icon(Icons.add),
        // on click of the app bar icon  , we call d method which opens d bottom sheet dat returns our NewTransaction form
        onPressed: _showModalSheet,
      )
    ]);
    final txWidget = Container(
      height: (MediaQuery.of(context).size.height -
          appBar.preferredSize.height -
          MediaQuery.of(context).padding.top) *
          0.7,
      child: TransactionList(
          userTransactions: _userTransactions,
          removeTransaction: _deleteTransaction),
    );
    return Scaffold(
      appBar: appBar,
      body: //ds widgets makes d app scrollable when there is overflow
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Show Chart"),
                  Switch(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = !_showChart;
                      });
                    },
                  )
                ],
              ),
            //if we are not on landscape, show chart
            if (!isLandscape)
              Container(
                height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(
                  recentTransactions: _recentTransactions,
                ),
              ),
            //also show transaction list widget if we are not landscape
            if (!isLandscape) txWidget,
            //only if we are on landscape, show either chart or transaction list
            if (isLandscape)
              _showChart
                  ? Container(
                height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                    0.7,
                child: Chart(
                  recentTransactions: _recentTransactions,
                ),
              )
                  :
              // we call our transaction list widget here dt renders all added transactions and we also pass the _deleteTransaction method for deletion
              txWidget
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
