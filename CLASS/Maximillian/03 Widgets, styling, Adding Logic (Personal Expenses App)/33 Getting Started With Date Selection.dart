/*
Currently, for any transaction we add, we are setting the date to DateTime.now(), we want to change this behavior so a user can select a date using the Date picker... So we will add a row inside our form which will contain 2 columns, one is an input field to output the selected date, the second column will be a button which we will handle the onpress to open date picker
*/

//new_transaction.dart

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  final Function
  addNewTransaction; //our button will call ds function passing in the user inputs for title and amount

//We define this constructor tru which we receive the event handler from the parent class
  NewTransaction({@required this.addNewTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    var enteredTitle = titleController.text;
    var enteredAmount = double.parse(amountController.text);

//Here we run a check to ensure we are not submitting empty values
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addNewTransaction(
        titleController.text, double.parse(amountController.text));
    //After adding a widget, we use ds method to close the top most screen that is displayed, which is our bottom sheet
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .end, //ds moves the children to d right, TextFields will not b affected due to their width but the btn will move which is what we want
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller: titleController,
                onSubmitted: (_) =>
                    submitData(), //ds is a syntax saying we gt an arg we are not using
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => submitData(),
              ),
              //Added a new row for date picker
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Text("No Date Chosen"),
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        "Choose Date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),

              //changed flat button to raised
              RaisedButton(
                onPressed: () {
                  submitData();
                },
                child: Text("Add Transaction"),
                textColor: Theme.of(context).textTheme.button.color,
                color: Theme.of(context).primaryColor,
              )
            ],
          ),
        ),
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
          button: TextStyle(color: Colors.white), //a new defined template for button text color
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
        amount: 53321039.20,
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

