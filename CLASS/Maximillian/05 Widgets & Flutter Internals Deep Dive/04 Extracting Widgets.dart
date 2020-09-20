/*
Another way we can optimize our app is by extracting a long widget tree into a smaller widgets.. For example, we can extract list item into another widget we can call "transaction_item.dart'
*/

//transaction_list.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../models/transaction.dart';
import '../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  //A list variable to hold our transaction, we will map ds variable later
  final List<Transaction> userTransactions;
//A function to remove a selected transaction by its id
  final Function removeTransaction;
  //A constructor that receives d transaction we passed to this widget and
  // set the value receives to our declared variable above
  TransactionList({@required this.userTransactions, this.removeTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: userTransactions.isEmpty
          ? LayoutBuilder(
        builder: (ctx, constraints) {
          return Column(
            children: <Widget>[
              Text(
                "No transactions added yet",
                style: Theme.of(context).textTheme.title,
              ),
              //We use the SizedBox widget to add space between 2 widgets
              SizedBox(
                height: 20,
              ),
              Container(
                height: constraints.maxHeight * 0.7,
                child: Image.asset(
                  "assets/images/waiting.png",
                  fit: BoxFit.cover,
                ),
//                  height: 200,
              )
            ],
          );
        },
      )
          : ListView.builder(
        itemCount: userTransactions
            .length, //d itemCount is required for the ListView builder to know how many times the itemBuilder function will be called
        // the itemBuilder will call the function passed to it for every item in the list
        itemBuilder: (context, index) {
          return new TransactionItem(
            removeTransaction: removeTransaction,
            userTransaction: userTransactions[index],
          );
        },
      ),
    );
  }
}


//transaction_item.dart
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Max/Widget%20&%20Styling/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    @required this.userTransaction,
    @required this.removeTransaction,
  });

  final Transaction userTransaction;
  final Function removeTransaction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 6,
        margin: EdgeInsets.symmetric(vertical: 10),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: FittedBox(child: Text("\$${userTransaction.amount}")),
            ),
          ),
          title: Text(
            userTransaction.title,
            style: Theme.of(context).textTheme.title,
          ),
          subtitle: Text(DateFormat.yMMMd().format(userTransaction.date)),
          //ds button will av an icon which will appear on d far right and onPress call a fn to remove the transaction
          trailing: MediaQuery.of(context).size.width > 460
              ? FlatButton.icon(
              onPressed: () {
                removeTransaction(userTransaction.id);
              },
              textColor: Theme.of(context).errorColor,
              icon: Icon(
                Icons.delete,
              ),
              label: Text("Delete"))
              : IconButton(
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).errorColor,
            ),
            onPressed: () {
              removeTransaction(userTransaction.id);
            },
          ),
        ),
      ),
    );
  }
}
