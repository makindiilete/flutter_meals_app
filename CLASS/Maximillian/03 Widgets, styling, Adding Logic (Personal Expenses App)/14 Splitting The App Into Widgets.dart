/* 
Now we will be working towards making our widgets stateful but first we need to note something, when we update the state, the build method is re-run and the widget we pass to the return method is re-render.. Now we have a long tree of widgets which will be re-rendered when we update the state but it is not all this details we want to render again because we are only interested in rendering the user inputs as a new card on the card list column, so our textfields remains the same, for this reason, we need to split our app into smaller widgets so we only update what matters..

1.  Create a new dart file 'transaction_list.dart'
2.  Create a new 'models' folder and move the 'transaction.dart' file there..
3.  Create a new 'widgets' folder and move the 'transaction_list.dart' file there
4.  Add two new widgets inside the widgets folder : - "new_transaction.dart" ==> This will contain our card widget form that we use to add a new transaction and "user_transactions.dart" ==> 
 */

//NewTransaction : - A form to add to add a new transaction
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function
  addNewTransaction; //our button will call ds function passing in the user inputs for title and amount

//We define this constructor tru which we receive the event handler from the parent class
  NewTransaction({@required this.addNewTransaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .end, //ds moves the children to d right, TextFields will not b affected due to their width but the btn will move which is what we want
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Title"),
                controller:
                titleController, // using the controller property, assign the title controller
                // Every keystroke we type on d this, we add d value to our titleInput var
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller:
                amountController, //using the controller property, assign d amountController
                // Every keystroke we type on this field, we add d value to our amountInput var
                // onChanged: (val) => amountInput = val,
              ),
              FlatButton(
                  onPressed: () {
                    addNewTransaction(titleController.text,
                        double.parse(amountController.text));
                  },
                  child: Text("Add Transaction"),
                  textColor: Colors.purple)
            ],
          ),
        ),
      ),
    );
  }
}

/*
TransactionList : - A row of cards containing added transactions
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
      child: Column(
          children: userTransactions.map((tx) {
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

/*
UserTransactions : - A widget containing our global state which then pass
transactions list and handler to add a new transaction to both NewTransaction
() and TransactionList()
*/
import 'package:flutter/material.dart';
import '../models/transaction.dart';

import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        amount: 69.00, date: DateTime.now(), id: "t1", title: "New Shoes"),
    Transaction(
        amount: 53.20,
        date: DateTime.now(),
        id: "t2",
        title: "Weekly Groceries")
  ];

  /*now we need our _answerQuestion to a title and amount from
  new_transaction.dart and add it to our transaction state thereby rendering
  the new updated list*/

  void _addNewTransaction(String txTitle, double txAmount) {
    var newTx = Transaction(id: DateTime.now().toString(), title: txTitle, amount:
    txAmount, date: DateTime.now());

//we update our _userTransactions state with our new transaction
    setState(() {
      _userTransactions.add(newTx);

    });
    print(newTx);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
//          This widget is our NewTransaction class/component that contains
//          the text fields and button for adding a new transaction.. We are
//          passing to the button an event handler '_addNewTransaction' to add a new transaction
          NewTransaction(addNewTransaction: _addNewTransaction),
          /*This widget contains our list of transactions and we pass our
          updated transactions to it */
          TransactionList(userTransactions: _userTransactions,)
        ],
      ),
    );
  }
}

/*
ExpenseApp : - Our root app
*/

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Max/Widget%20&%20Styling/widgets/user_transactions.dart';

class ExpenseApp extends StatelessWidget {
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
/*This is the widget that contains both the TransactionList() (widget to render our updated transactions) and NewTransaction() (widget that contains the form to add a new widget)*/
            UserTransactions()
          ],
        ),
      ),
    );
  }
}
