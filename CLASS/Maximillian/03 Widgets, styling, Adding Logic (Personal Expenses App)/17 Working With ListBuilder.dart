/*
Now that we know th difference between ListView and List builder, let us see
ListBuilder in action..

With a ListBuilder, we no longer need to map our list to a widget, instead the builder will call the builder function for every item in the list and build them to a widget...
2.  To access value of each item in the list, we can use the name of the list and the index flutter gives to each item to extract a particular property e.g. userTransactions[index].amount
*/

import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

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
                            border: Border.all(width: 2, color: Colors.purple)),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Text(
                          '\$${userTransactions[index].amount}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple),
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
