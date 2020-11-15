import 'package:flutter/material.dart';

class AgendaItem {
  static const String ITEM_MINUTES = "Minutes";
  static const String ITEM_NAME = "Name";
  static const String COLOR = "Color";

  static const String DEFAULT_NAME = "New Item";
  static const num DEFAULT_MINUTES = 15;

  final String name;
  final num minutes;
  final Color color;

  AgendaItem({this.name = DEFAULT_NAME, this.minutes = DEFAULT_MINUTES, this.color = Colors.red});

  AgendaItem.fromMap(Map<String, dynamic> data)
      : minutes = data[ITEM_MINUTES],
        name = data[ITEM_NAME],
        color = data[COLOR];

  Map<String, dynamic> toMap() => {
    ITEM_MINUTES: minutes,
    ITEM_NAME: name,
    COLOR: color.toString()
  };
}
