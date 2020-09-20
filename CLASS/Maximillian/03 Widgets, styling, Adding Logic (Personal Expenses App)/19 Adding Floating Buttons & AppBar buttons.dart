/* 
From the wireframe of the app, we stated that our form fields will not be visible by default, instead it will become visible when we tap on the floating action button or when we click on the button on the appbar, so first let see how we can add them..

ADDING A BUTTON TO THE APPBAR
Our appbar takes 'actions' property and this then can take any widget we pass to it, for now we will pass an icon button which is an icon inside a button

 */
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Max/Widget%20&%20Styling/widgets/user_transactions.dart';

class ExpenseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter App"), actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () {})
        ]),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
