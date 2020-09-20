/*
Currently, when we want to add a new transaction using our bottom sheet, the softkeyboard blocks the view and we constantly need to close the keyboard manually to type on smaller screens and on landscape.. Flutter provides us with a way to handle this, which will then move the content upward..
*/

//new_transactions.dart
import 'package:flutter/material.dart';
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
                    FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(
                        "Choose Date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: _presentDatePicker,
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
