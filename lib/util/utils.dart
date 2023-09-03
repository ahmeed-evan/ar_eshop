import 'package:flutter/material.dart';

import '../domain/product_details.dart';

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

final List<ProductDetails> _productList = [
  ProductDetails(
      productPrice: "\$ 12.00",
      productName: "Black Simple Lamp",
      productURL: "assets/images/Mask Group.png",
      productRatting: 4.5,
      productReview: "50",
      productDescription:
          "Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home."),
  ProductDetails(
      productPrice: "\$ 25.00",
      productName: "Minimal Stand",
      productURL: "assets/images/Mask Group (1).png",
      productReview: "25",
      productRatting: 4.5,
      productDescription:
          "Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home."),
  ProductDetails(
      productPrice: "\$ 30.00",
      productName: "Coffee Chair",
      productURL: "assets/images/Mask Group (2).png",
      productRatting: 4.5,
      productReview: "12",
      productDescription:
          "Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home."),
  ProductDetails(
      productPrice: "\$ 50.00",
      productName: "Simple Desk",
      productURL: "assets/images/Mask Group (3).png",
      productRatting: 4.5,
      productReview: "43",
      productDescription:
          "Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home."),
];

List<ProductDetails> get productList => _productList;
