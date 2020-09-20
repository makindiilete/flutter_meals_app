/* 
Just as we create a model when working with apps which will be responsible to define the interface of our app, we will be creating our transaction model which is going to define the fields we will be needing and their type

1.  Add a new file to the lib folder 'transaction.dart'
 */

//transaction.dart
import 'package:flutter/material.dart';

class Transaction {
  //fields
  final String id;
  final String title;
  final double amount;
  final DateTime date;

//We add a constructor with named arguments i.e. We will be able to call d ctor ds way :
/* 
Transaction(amount: 69.00, date: DateTime.now(), id: "t1", title: "New Shoes")

And we make all fields required
 */
  Transaction(
      {@required this.id,
      @required this.title,
      @required this.amount,
      @required this.date});
}

//expenseApp
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';

class Playground extends StatelessWidget {
  //We create a list of transactions using our transaction model
  final List<Transaction> transactions = [
    Transaction(
        amount: 69.00, date: DateTime.now(), id: "t1", title: "New Shoes"),
    Transaction(
        amount: 53.20,
        date: DateTime.now(),
        id: "t2",
        title: "Weekly Groceries")
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter App"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              color: Colors.red,
              child: Text("LIST OF TX!"),
            )
          ],
        ),
      ),
    );
  }
}

