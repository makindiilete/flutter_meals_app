/*
Now we will see how we can make use of images in our app.... We want to render an image when we have no transactions available... To do this, we can comment our our transaction list...

1)  Add the path to your images folder in pubspec.yaml file under 'dev_dependencies'
2)  Use the 'Image()' widget and call the property you need depending on where u are serving the image from e.g. Image.assets() : - if u using a locally stored image, Image.network() : - if u r fetching an image from online uri

IMAGE ATTRIBUTES
1)  fit: BoxFit.cover, : - This is the css cover attribute for flutter which u can use to squiz and image to fit using the 'fit' property
*/

//transaction_list.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

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
      child: userTransactions.isEmpty
          ? Column(
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
            child: Image.asset(
              "assets/images/waiting.png",
              fit: BoxFit.cover,
            ),
            height: 200,
          )
        ],
      )
          : ListView.builder(
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
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor)),
                        margin: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
                        child: Text(
                          '\$${userTransactions[index].amount.toStringAsFixed(2)}', //rounds up our amount to 2 decimal places
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
                        )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          userTransactions[index].title,
//                          style: TextStyle(
//                              fontSize: 16, fontWeight: FontWeight.bold),
//                        ),
                          //our title converted to use the 'textTheme.title' we've defined in main dart theme data
                          style: Theme.of(context).textTheme.title,
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
