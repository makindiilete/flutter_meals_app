/* 
Let us review the different args we can use to style our texts
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
                                    Border.all(width: 2, color: Colors.purple)),
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: Text(
                              tx.amount.toString(),
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
                              tx.date.toString(),
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
