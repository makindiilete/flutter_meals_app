/*
We want to configure color themes for our app so that we can use our primary, secondary color etc instead of hardcoding the colors we use all around the place using the "Colors.colorName"..
We can set a theme for our app using the "theme" property of the "MaterialApp" widget...
Your theme can comprises of : -
Colors,
Fonts,
FontSize etc...

Defining a theme : -

ExpenseApp(),
    theme: ThemeData(
        primarySwatch: Colors.purple, //primary
        accentColor: Colors // secondary (ds does not have a swatch
            .amber),
  )

PRIMARY SWATCH OR PRIMARY COLOR : - If u use a watch, ur app will not have a single color but the color u specified will be broken into shades of colors and but if u use primaryColor, ur app will have a single color...
*/

//main.dart
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Max/Widget%20&%20Styling/widgets/new_transaction.dart';

import 'Max/Widget & Styling/models/transaction.dart';
import 'Max/Widget & Styling/widgets/transaction_list.dart';

//We need to change ds syntax from what we have been using to ds, to make our bottom sheet work
void main() {
  runApp(MaterialApp(
    home: ExpenseApp(),
    theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors
            .amber), //we define a color "swatch", with ds flutter will auto generate shades of ds color and split them into respective usages
  ));
}

// the root widget of our application
class ExpenseApp extends StatefulWidget {
  @override
  _ExpenseAppState createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  final List<Transaction> _userTransactions = [
    Transaction(
        amount: 69.00, date: DateTime.now(), id: "t1", title: "New Shoes"),
    Transaction(
        amount: 53.20,
        date: DateTime.now(),
        id: "t2",
        title: "Weekly Groceries")
  ];

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
            Container(
              width: double.infinity,
              child: Card(
                color: Theme.of(context).primaryColor,
                child: Text("CHART"),
                elevation: 5,
              ),
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



//transactionList
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

//This class will receive new transactions and render it to the UI
class TransactionList extends StatelessWidget {
  //A list variable to hold our transaction, we will map ds variable later
  final List<Transaction> userTransactions;

  //A constructor that receives d transaction we passed to this widget and
  // set the value receives to our declared variable above
  TransactionList({@required this.userTransactions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: userTransactions
            .length, //d itemCount is required for the ListView builder to know how many times the itemBuilder function will be called
        // the itemBuilder will call the function passed to it for every item in the list
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(10),
                        // We can use d BoxDecoration to give our container a border so our price can stay inside a black box
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor)),
                        margin:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Text(
                          '\$${userTransactions[index].amount.toStringAsFixed(2)}', //rounds up our amount to 2 decimal places
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          userTransactions[index].title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat.yMMMd()
                              .format(userTransactions[index].date),
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
