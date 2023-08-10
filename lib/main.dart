import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screen/home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: _themeData, home: Home());
  }
}

ThemeData _themeData = ThemeData(
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
