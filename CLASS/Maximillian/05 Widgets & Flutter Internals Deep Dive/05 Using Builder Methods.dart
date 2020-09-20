/*
In our main.dart file, we have various if..else check for portrait and landscape mode and we rendering different content base on the orientation we are on.. We can extract this into builder methods and make our code more readable... This will not increase performance but will make our code readable
*/

//main.dart
import 'dart:io';

import 'package:flutter/cupertino.dart';
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

  List<Widget> _buildLandscapeContent(mediaQuery, appBar, txWidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Show Chart",
            style: Theme.of(context).textTheme.title,
          ),
          Switch.adaptive(
            activeColor: Theme.of(context).accentColor,
            value: _showChart,
            onChanged: (val) {
              setState(() {
                _showChart = !_showChart;
              });
            },
          )
        ],
      ),
      _showChart
          ? Container(
        height: (mediaQuery.size.height -
            appBar.preferredSize.height -
            mediaQuery.padding.top) *
            0.7,
        child: Chart(
          recentTransactions: _recentTransactions,
        ),
      )
          :
      // we call our transaction list widget here dt renders all added transactions and we also pass the _deleteTransaction method for deletion
      txWidget
    ];
  }

  List<Widget> _buildPortraitContent(mediaQuery, appBar, txWidget) {
    return [
      Container(
        height: (mediaQuery.size.height -
            appBar.preferredSize.height -
            mediaQuery.padding.top) *
            0.3,
        child: Chart(
          recentTransactions: _recentTransactions,
        ),
      ),
      txWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation ==
        Orientation
            .landscape; //ds will be true if we are on landscape mode and base on ds, we can render different content
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
      middle: Text("Personal Expenses"), //title
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            child: Icon(CupertinoIcons.add),
            onTap: _showModalSheet,
          )
        ],
      ), //action : - we create custom action as we do not have the actions prop in cupertino
    )
        : AppBar(title: Text("Personal Expenses"), actions: <Widget>[
      IconButton(
        icon: Icon(Icons.add),
        // on click of the app bar icon  , we call d method which opens d bottom sheet dat returns our NewTransaction form
        onPressed: _showModalSheet,
      )
    ]);
    final txWidget = Container(
      height: (mediaQuery.size.height -
          appBar.preferredSize.height -
          mediaQuery.padding.top) *
          0.7,
      child: TransactionList(
          userTransactions: _userTransactions,
          removeTransaction: _deleteTransaction),
    );

    final pageBody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (isLandscape)
            // bcos we are returning a list from ds method and we cannot have a list inside another widget list which we are working with here i.e. We are inside 'children: <Widget>[]' list, we need to use the spread operator to map each content of the method list to a child of ds list down here.. ds is not required if we are returning just a single item from d builder method
              ..._buildLandscapeContent(mediaQuery, appBar, txWidget),
            if (!isLandscape)
              ..._buildPortraitContent(mediaQuery, appBar, txWidget),
          ],
        ),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
      child: pageBody, //body
      navigationBar: appBar, //appBar
    )
        : Scaffold(
      appBar: appBar,
      body:
      pageBody //ds widgets makes d app scrollable when there is overflow
      ,
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Platform.isIOS
          ? null
          : FloatingActionButton(
        // on click of the floating button, we call d method which opens d bottom sheet dat returns our NewTransaction form
        onPressed: _showModalSheet,
        child: Icon(Icons.add),
      ),
    );
  }
}
