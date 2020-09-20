/*
Now we want to wire up our newly added button to show date picker
*/

//New_transaction.dart
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
    var enteredTitle = _titleController.text;
    var enteredAmount = double.parse(_amountController.text);

//Here we run a check to ensure we are not submitting empty values
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addNewTransaction(
        _titleController.text, double.parse(_amountController.text));
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
