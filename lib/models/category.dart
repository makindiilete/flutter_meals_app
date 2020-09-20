import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color; //background color... ds is not a required field so we set a default value incase no value is passed

  //A const constructor which means after init, d value of each field cannot be changed
  const Category({@required this.id, @required this.title, this.color = Colors.orange});
}
