/* 
Now we want to style our cards to look better...

The way you style widgets in flutter is different from the approach of web app where u have a spearate css file, in flutter, you style widgets through the arguments they take..

NOTE: - If the widget you wanna style does not take the particular style you wanna use then you need to wrap it with another widget that takes that style e.g. A column does not take a background style but you can wrap your column in a container and give it a background color
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
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(10),
                            // We can use d BoxDecoration to give our container a border so our price can stay inside a black box
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black)),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Text(tx.amount.toString())),
                        Column(
                          children: <Widget>[
                            Text(tx.title),
                            Text(tx.date.toString())
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
