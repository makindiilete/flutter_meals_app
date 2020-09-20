/*
Now we want to add ability to delete a transaction
*/

//transaction_list.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

//This class will receive new transactions and render it to the UI
class TransactionList extends StatelessWidget {
  //A list variable to hold our transaction, we will map ds variable later
  final List<Transaction> userTransactions;
//A function to remove a selected transaction by its id
  final Function removeTransaction;
  //A constructor that receives d transaction we passed to this widget and
  // set the value receives to our declared variable above
  TransactionList({@required this.userTransactions, this.removeTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: userTransactions.isEmpty
          ? Column(
        children: <Widget>[
          Text(
            "No transactions added yet",
            style: Theme.of(context).textTheme.title,
          ),
          //We use the SizedBox widget to add space between 2 widgets
          SizedBox(
            height: 20,
          ),
          Container(
            child: Image.asset(
              "assets/images/waiting.png",
              fit: BoxFit.cover,
            ),
            height: 200,
          )
        ],
      )
          : ListView.builder(
        itemCount: userTransactions
            .length, //d itemCount is required for the ListView builder to know how many times the itemBuilder function will be called
        // the itemBuilder will call the function passed to it for every item in the list
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Card(
              elevation: 6,
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: FittedBox(
                        child:
                        Text("\$${userTransactions[index].amount}")),
                  ),
                ),
                title: Text(
                  userTransactions[index].title,
                  style: Theme.of(context).textTheme.title,
                ),
                subtitle: Text(DateFormat.yMMMd()
                    .format(userTransactions[index].date)),
                //ds button will av an icon which will appear on d far right and onPress call a fn to remove the transaction
                trailing: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  ),
                  onPressed: () {
                    removeTransaction(userTransactions[index].id);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



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
    Transaction(
        amount: 69.00,
        date: DateTime.now().subtract(Duration(days: 1)),
        id: "t1",
        title: "New Shoes"),
    Transaction(
        amount: 51.20,
        date: DateTime.now().subtract(Duration(days: 3)),
        id: "t2",
        title: "Weekly Groceries")
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
            // we call our transaction list widget here dt renders all added transactions and we also pass the _deleteTransaction method for deletion
            TransactionList(
                userTransactions: _userTransactions,
                removeTransaction: _deleteTransaction)
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
