import 'package:ar_e_shop/screen/view/app_entry.dart';
import 'package:ar_e_shop/screen/view/favourites.dart';
import 'package:ar_e_shop/screen/view/my_cart.dart';
import 'package:ar_e_shop/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screen/view/home.dart';

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
    return MaterialApp(theme: themeData, home: MyCart());
  }
}