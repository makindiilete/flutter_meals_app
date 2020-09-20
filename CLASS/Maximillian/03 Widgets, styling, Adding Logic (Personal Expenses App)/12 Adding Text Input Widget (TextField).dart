/* 
Now we want to add ability for users to be able to add new transactions using text input and a button..
We will be needing text inputs for the title, amount and date and this 3 input fields will sit on a card
So we are going to have a card and a column of 3 TextField() widgets..
We can wrap our column of textfields with a container so we can have some space between the fields and the card..

TextField() popular properties : - 
1.  Autofocus : - make the particular text field auto focusable when the app loads
2.  CursorColor : - The color of the blinking cursor
3.  AutoCorrect : - Automatically correct inputs
4.  Enable : - Whether the text field sud be enabled i.e. user can tap to enter text or disable dat

Adding A Label to our text field
The textfield includes a 'decoration' property with which we can call the "InputDecoration()" class that provides us alot of functions like adding label, validations etc
 */

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
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: "Amount"),
                    ),
                    FlatButton(
                        onPressed:
                            () {}, //an empty fn, ds will make d btn enabled
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
