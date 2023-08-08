import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
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
    return MaterialApp(theme: _themeData, home:  Home());
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
