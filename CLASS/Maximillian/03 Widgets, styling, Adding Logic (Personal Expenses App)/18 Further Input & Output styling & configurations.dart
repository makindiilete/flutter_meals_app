/* 
Now we want to take our app further and add some couple of features e.g. 
We want to turn on only numbers for our soft keyboard when we tap on the amount field, 
we also want to be able to add transaction by simply using the DONE key on the softkeyboard
We also want to round up our amount to 2 decimal place always..

KEYBOARD TYPE :-
In the TextField widget for amount, we have a property we can use to define the type of keyboard we want to show
keyboardType: TextInputType.number, //android
keyboardType: TextInputType.numberWithOptions(decimal: true), //iOS ds allows the decimal
 */

//expenseApp.dart
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
          body:
              //ds widgets makes d app scrollable when there is overflow
              SingleChildScrollView(
            child: Column(
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
          )),
    );
  }
}



//NewTransaction
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

  void submitData() {
    var enteredTitle = titleController.text;
    var enteredAmount = double.parse(amountController.text);

//Here we run a check to ensure we are not submitting empty values
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addNewTransaction(
        titleController.text, double.parse(amountController.text));
  }

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
                controller: titleController,
                onSubmitted: (_) =>
                    submitData(), //ds is a syntax saying we gt an arg we are not using
              ),
              TextField(
                decoration: InputDecoration(labelText: "Amount"),
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => submitData(),
              ),
              FlatButton(
                  onPressed: () {
                    submitData();
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

//TramsactionList

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
                          '\$${userTransactions[index].amount.toStringAsFixed(2)}', //rounds up our amount to 2 decimal places
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

