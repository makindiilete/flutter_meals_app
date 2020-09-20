/*
We want to finish our landscape mode,
1)  currently the chart looks tiny, we should make it takes as much space as possible since we are only showing chart when switch is turned on.
2)  Also we should adjust the overflow we are having for no transaction image
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
                trailing: IconButton(
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
