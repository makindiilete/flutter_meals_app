/* 
Our floating icon and the app bar icon will trigger a button sheet which we will be adding in this video via a method which we will share btw the floating icon and the app bar icon.

This method takes a builder parameter which returns the widget we want to show in the bottom sheet.. We will be showing our NewTransaction widget which is our new transaction form but this is inside our userTransactions widget, to use it inside the expenseDart root class, we will have to convert our root class to stateful widget and move our state back there...

Changing state back and forth might look tiring but it is fine for now to lift state up, later we will learn about a more elegant approach that prevents this back and forth..

So Now we can delete the user transaction file since we have removed our
state from there and our methods..
NOTE : - For our Modal Sheet to work, we need to move our 'expenseApp.dart' inside the main.dart file
 */

//main.dart
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Max/Widget%20&%20Styling/widgets/new_transaction.dart';

import 'Max/Widget & Styling/models/transaction.dart';
import 'Max/Widget & Styling/widgets/transaction_list.dart';

//We need to change ds syntax from what we have been using to ds, to make our bottom sheet work
void main() {
  runApp(MaterialApp(home: ExpenseApp()));
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
      appBar: AppBar(title: Text("Flutter App"), actions: <Widget>[
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
                color: Colors.blue,
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
