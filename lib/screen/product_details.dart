import 'package:ar_e_shop/domain/product_details.dart';
import 'package:ar_e_shop/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key, required this.productDetails})
      : super(key: key);
  final ProductDetails productDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(productDetails.productURL ?? "",fit: BoxFit.fitWidth),
            ),
          ),
          Positioned(child: _backButton(),top: MediaQuery.of(context).viewPadding.top + 20,left: 20),
        ],),
      ],
    );
  }

  _backButton() {
    return Container(
        padding: const EdgeInsets.only(left: 10, bottom: 8, right: 6, top: 8),
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: .5,
                blurRadius: 7,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ]),
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.grey.shade400,
        ));
  }
}
