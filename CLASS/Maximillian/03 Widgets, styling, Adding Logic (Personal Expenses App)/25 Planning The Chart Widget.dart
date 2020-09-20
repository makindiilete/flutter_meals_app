/*
We want to start working on our chart.. For this, we will create a new widget file 'chart.dart'...

For complex charting functions, we have 3rd party plugins we can use but for the basic chart we need, we wont need anything complex
*/

//chart.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
    );
  }
}
