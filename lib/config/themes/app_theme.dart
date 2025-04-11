import 'package:flutter/material.dart';

const colorsList = <Color>[
  Colors.pink,
  Colors.deepPurple,
  Colors.indigo,
  Colors.blue,
  Colors.lightBlue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.lightGreen,
  Colors.lime,
  Colors.amber,
  Colors.orange,
  Colors.deepOrange,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey,
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0})
    : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
      assert(
        selectedColor < colorsList.length,
        'Selected color must be less then ${colorsList.length - 1}',
      );

  ThemeData getTheme({Color? appBarColor}) => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorsList[selectedColor],
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: appBarColor ?? colorsList[selectedColor],
    ),
  );
}
