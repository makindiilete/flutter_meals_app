/* 
Another alternative is to wrap only our transaction lists in a ListView widget..
We have two types of ListViews : - 
1.  ListView(children: []) : - Useful for short list, all items will be rendered even the once not visible so for performance issues, do not use it for very long list or list you do not know in advance how many items you will be getting.
2.  ListView.builder() : - Useful for long list and list from server when you do not know how many items you will be getting because it lazy load the list and items not in the view port are not rendered until we scroll them into viewport.

ListView contains many properties but the only important one is the scroll
direction, you can use this, if you want to scroll horizontally i.e.
Scrolling on a row, the default is vertical.

So now we can make use of our list view inside the transaction list where we
have our list of transactions.. So all we need to do is to replace our column
 widget with list view
 */

//transaction_list.dart
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
    return
//      We wrapping our ListView inside a container because this widget is
//      wrapped inside a column in user_transactions widget and a ListView
//      cannot be directly wrapped by a column widget because a column will
//      take only the available space on the view port while ListView takes
//      infinite length so there will be conflict.. This is while we need to
//      wrap it inside a container and give it a precise height...
      Container(
      height: 300,
      child: ListView(
          children:
          userTransactions.map((tx) {
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
          }).toList()),
    );
  }
}

