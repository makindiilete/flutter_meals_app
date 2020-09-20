/*
When we are on landscape, definitely, the width of our transaction list will be wider, we can make use of this additional space and render more content like description of what the trash icon will do when it is pressed.
For this implementation however, we do not want to check for orientation but simply check if the list is wider than 360px then we can render a button with a text which flutter provides us with the FlatButton.icon widget
*/

//transaction_list.dart
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

//This class will receive new transactions and render it to the UI
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
                    child: FittedBox(
                        child:
                        Text("\$${userTransactions[index].amount}")),
                  ),
                ),
                title: Text(
                  userTransactions[index].title,
                  style: Theme.of(context).textTheme.title,
                ),
                subtitle: Text(DateFormat.yMMMd()
                    .format(userTransactions[index].date)),
                //ds button will av an icon which will appear on d far right and onPress call a fn to remove the transaction
                // if the width of our list is greater than 460px, we show d button with a text, else we show only the icon
                trailing: MediaQuery.of(context).size.width > 460
                    ? FlatButton.icon(
                    onPressed: () {
                      removeTransaction(userTransactions[index].id);
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
                    removeTransaction(userTransactions[index].id);
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
