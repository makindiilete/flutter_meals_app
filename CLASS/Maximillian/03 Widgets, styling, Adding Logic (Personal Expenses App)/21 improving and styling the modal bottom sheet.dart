/*
Now we have some few issues with our bottom sheet : -
1)  When we type and go to the next field, the previous feed get wiped off : To fix ds, all we need to do is to convert the widget the bottom sheet renders (NewTransaction()) from stateless to a stateful widget....
2)  Another issue we need to fix is when we type inside the bottom sheet and submit, the bottom sheet should close automatically.. We can do this using 'Navigator.of(context).pop();'
*/

//NewTransaction
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  final Function
  addNewTransaction; //our button will call ds function passing in the user inputs for title and amount

//We define this constructor tru which we receive the event handler from the parent class
  NewTransaction({@required this.addNewTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    var enteredTitle = titleController.text;
    var enteredAmount = double.parse(amountController.text);

//Here we run a check to ensure we are not submitting empty values
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addNewTransaction(
        titleController.text, double.parse(amountController.text));
    //After adding a widget, we use ds method to close the top most screen that is displayed, which is our bottom sheet
    Navigator.of(context).pop();
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
