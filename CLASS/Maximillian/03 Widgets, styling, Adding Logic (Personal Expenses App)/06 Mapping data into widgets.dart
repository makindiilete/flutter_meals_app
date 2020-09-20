/* 
Now that we have created 2 transactions, let us map this into a list
 */

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';

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
            Column(
                children: transactions.map((tx) {
              return Card(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[Text(tx.title)],
                    ),
                    Row(
                      children: <Widget>[
                        Text(tx.amount.toString()),
                        Text(tx.date.toString())
                      ],
                    )
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
