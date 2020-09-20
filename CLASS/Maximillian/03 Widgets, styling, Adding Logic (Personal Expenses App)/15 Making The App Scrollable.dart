/* By default, In a web app, when content exceed the current view port, we can scroll down to view more content but we do not have this default behavior in mobile apps and that is while when our content exceed the screen, we have this kind of image we can see here https://prnt.sc/u52kog

How do we solve this : - 

We can wrap all the content on our page with a widget that allows our content to scroll when we have overflow. This is the SingleChildScrollView() */

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
        ),
      ),
    );
  }
}
