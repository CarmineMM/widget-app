import 'package:flutter/material.dart';

const colorsList = <Color>[
  Colors.white,
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
  Colors.yellowAccent,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({this.selectedColor = 0, this.isDarkMode = false})
    : assert(selectedColor >= 0, 'Selected color must be greater then 0'),
      assert(
        selectedColor < colorsList.length,
        'Selected color must be less then ${colorsList.length - 1}',
      );

  ThemeData getTheme({Color? appBarColor}) => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorsList[selectedColor],
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor:
          colorsList[selectedColor] == Colors.white && isDarkMode
              ? Colors.black
              : colorsList[selectedColor],
    ),
  );

  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode,
  );
}
