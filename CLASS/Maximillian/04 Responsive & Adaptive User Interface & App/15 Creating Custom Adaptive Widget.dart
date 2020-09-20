/*
We can extract our choose date button into an adaptive button widget and inside that widget we perform all the operation to checkthe platform we are running and what we should render so we simple use the button directly anywhere without tenary operator
*/

//adaptive_flat_button.dart
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  final Function presentDatePicker;
  final String buttonLabel;

  const AdaptiveFlatButton(
      {this.presentDatePicker, @required this.buttonLabel});
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
        child: Text(
          buttonLabel,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: presentDatePicker)
        : FlatButton(
      textColor: Theme.of(context).primaryColor,
      child: Text(
        buttonLabel,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onPressed: presentDatePicker,
    );
  }
}


//new_transaction.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Max/Widget%20&%20Styling/widgets/adaptive_flat_button.dart';
import 'package:intl/intl.dart';

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
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();

  DateTime _selectedDateController;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    var enteredTitle = _titleController.text;
    var enteredAmount = double.parse(_amountController.text);

//Here we run a check to ensure we are not submitting empty values
    if (enteredTitle.isEmpty ||
        enteredAmount <= 0 ||
        _selectedDateController == null) {
      return;
    }
    widget.addNewTransaction(_titleController.text,
        double.parse(_amountController.text), _selectedDateController);
    //After adding a widget, we use ds method to close the top most screen that is displayed, which is our bottom sheet
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    var currentDate = new DateTime.now().toString();
    var dateParse = DateTime.parse(currentDate);
    var year = dateParse.year;
    showDatePicker(
        context: context,
        initialDate: DateTime.now(), //initial selected date
        firstDate:
        DateTime(year), //U can only select from beginning of 2020
        lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDateController = pickedDate;
      });
    }); // to current date
  }

  @override
  Widget build(BuildContext context) {
    return
      //ds makes our form scrollable so user can scroll to reach all inputs
      SingleChildScrollView(
        child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
                top: 10,
                left: 10,
                right: 10,
                bottom: MediaQuery.of(context).viewInsets.bottom +
                    10), //we dynamically calculated the total size d soft keyboard takes and add our 10px
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .end, //ds moves the children to d right, TextFields will not b affected due to their width but the btn will move which is what we want
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: "Title"),
                  controller: _titleController,
                  onSubmitted: (_) =>
                      _submitData(), //ds is a syntax saying we gt an arg we are not using
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Amount"),
                  controller: _amountController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSubmitted: (_) => _submitData(),
                ),
                Container(
                  height: 70,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(_selectedDateController == null
                            ? "No Date Chosen"
                            : "Picked Date : ${DateFormat.yMd().format(_selectedDateController)}"),
                      ),
                      AdaptiveFlatButton(
                        presentDatePicker: _presentDatePicker,
                        buttonLabel: "Choose Date",
                      )
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    _submitData();
                  },
                  child: Text("Add Transaction"),
                  textColor: Theme.of(context).textTheme.button.color,
                  color: Theme.of(context).primaryColor,
                )
              ],
            ),
          ),
        ),
      );
  }
}
