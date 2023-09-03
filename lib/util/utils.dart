import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
  // scaffoldBG, applicable for aLL PAGES
  scaffoldBackgroundColor: Colors.white,
  //primary color for the application
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.black,
  ),
);

SizedBox customHeight(double height) => SizedBox(height: height);

SizedBox customWeight(double weight) => SizedBox(width: weight);

TextStyle defaultTestStyle =
    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
TextStyle smallTestStyle =
    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
TextStyle largeTestStyle =
    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
TextStyle titleTestStyle =
    const TextStyle(fontSize: 24, fontWeight: FontWeight.w500);
