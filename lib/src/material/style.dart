
import 'dart:math';

import 'package:flutter/material.dart';

class Style {
  static const titleStyle = TextStyle(fontSize: 36.0, color: bannerColor);
  static const keypadStyle = TextStyle(fontSize: 24.0, color: bannerColor);
  static const subTitleStyle = TextStyle(fontSize: 20.0, color: bannerColor);
  static const bgColor = Color.fromRGBO(242, 246, 247, 1.0);
  static const bannerColor = Color.fromRGBO(45, 58, 58, 1.0);
  static const bannerColorFaded = Color.fromRGBO(45, 58, 58, .5);
  
  static const greenColor = Color.fromRGBO(43, 168, 74, 1.0);
  static const greenColorFaded = Color.fromRGBO(43, 168, 74, .5);
  
  static const yellowColor = Color.fromRGBO(236, 212, 68, 1.0);
  static const yellowColorFaded = Color.fromRGBO(236, 212, 68, .5);

  static final yellowGradient = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [yellowColor, yellowColorFaded], stops: [0.0, 1.0]);
  static final greenGradient = LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [greenColor, greenColorFaded], stops: [0.0, 1.0]);
  
  static getRandomColor(List<Color> toExclude){
    List<Color> potentialColors = List<Color>.from(Colors.primaries.map((e) => e.shade500))..removeWhere((e) => toExclude.contains(e));
    return potentialColors[Random().nextInt(potentialColors.length)];
  }
  
}
