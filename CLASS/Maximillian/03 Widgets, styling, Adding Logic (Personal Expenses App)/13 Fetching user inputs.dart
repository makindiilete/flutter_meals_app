/* 
Now we want to make sure we can fetch and display our user inputs and add it as a new transaction upon button click..
There are two ways we can get access to user inputs : - 
1.  Option 1 : - We can save user input with every keystroke and save it in a variable... Bear in mind that we are currently using is a stateless widget..
WHAT DOES THIS MEAN?
Since we are using a stateless widget, getting the input of the user and saving it inside a variable does not make sense because even though we can do this, because it is a stateless widget, the changes we make will not be updated on the UI..
2.  Flutter provides a class which we can use out of the box "TextEditingController"

TEXT FIELD EVENTS
onChange : - This fires on every click
onEditingComplete : - This fires when a user clicks on the 'Done', 'Go', 'Next' button on the soft keyboard or whatever button that is showing in that area
onSubmitted : - This fires when a user clicks on the 'Done' button alone and not any other type of button on the soft keyboard so if you configure your soft button to show another type of button, this will not work.
onTap : - Whenever you tap into the text field

 */

//Getting user inputs and printing it in the console
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class Playground extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        amount: 69.00, date: DateTime.now(), id: "t1", title: "New Shoes"),
    Transaction(
        amount: 53.20,
        date: DateTime.now(),
        id: "t2",
        title: "Weekly Groceries")
  ];
  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text("CHART"),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .end, //ds moves the children to d right, TextFields will not b affected due to their width but the btn will move which is what we want
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: "Title"),
                      // Every keystroke we type on d this, we add d value to our titleInput var
                      onChanged: (val) {
                        titleInput = val;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Amount"),
                      // Every keystroke we type on this field, we add d value to our amountInput var
                      onChanged: (val) => amountInput = val,
                    ),
                    FlatButton(
                        onPressed: () {
                          print(titleInput);
                          print(amountInput);
                        }, //an empty fn, ds will make d btn enabled
                        child: Text("Add Transaction"),
                        textColor: Colors.purple)
                  ],
                ),
              ),
            ),
            Column(
                children: transactions.map((tx) {
              return Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(10),
                            // We can use d BoxDecoration to give our container a border so our price can stay inside a black box
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.purple)),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Text(
                              '\$${tx.amount}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purple),
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              tx.title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat.yMMMd().format(tx.date),
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList())
          ],
        ),
      ),
    );
  }
}

/* 
Now we will see linter complaining that our class is marked as immutable but the values of some variables are not final... This is because we update the value of the title and amount inside a stateless widget, though it works now bcos we are only logging those values and not updating the UI with them but if we are to work to standard and from what we want to do which is to add a new transaction, we will need to work with a stateful widget */

//GETTING USER INPUTS WITH TEXT EDITING CONTROLLER
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class Playground extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        amount: 69.00, date: DateTime.now(), id: "t1", title: "New Shoes"),
    Transaction(
        amount: 53.20,
        date: DateTime.now(),
        id: "t2",
        title: "Weekly Groceries")
  ];
  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text("CHART"),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .end, //ds moves the children to d right, TextFields will not b affected due to their width but the btn will move which is what we want
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: "Title"),
                      controller:
                          titleController, // using the controller property, assign the title controller
                      // Every keystroke we type on d this, we add d value to our titleInput var
                      // onChanged: (val) {
                      //   titleInput = val;
                      // },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Amount"),
                      controller:
                          amountController, //using the controller property, assign d amountController
                      // Every keystroke we type on this field, we add d value to our amountInput var
                      // onChanged: (val) => amountInput = val,
                    ),
                    FlatButton(
                        onPressed: () {
                          print(titleController
                              .text); //print d input value calling d specific controller text property
                          // print(titleInput);
                          // print(amountInput);
                        }, //an empty fn, ds will make d btn enabled
                        child: Text("Add Transaction"),
                        textColor: Colors.purple)
                  ],
                ),
              ),
            ),
            Column(
                children: transactions.map((tx) {
              return Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(10),
                            // We can use d BoxDecoration to give our container a border so our price can stay inside a black box
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.purple)),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Text(
                              '\$${tx.amount}',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.purple),
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              tx.title,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              DateFormat.yMMMd().format(tx.date),
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList())
          ],
        ),
      ),
    );
  }
}
