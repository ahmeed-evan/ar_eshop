import 'package:ar_e_shop/domain/product_details.dart';
import 'package:ar_e_shop/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/utils.dart';
import '../widget/custom_button.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key, required this.productDetails})
      : super(key: key);
  final ProductDetails productDetails;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final List<Color> colorsList = [
    Colors.white,
    Colors.deepOrangeAccent,
    Colors.blueGrey
  ];

  int selectedIndex = 0;
  int addedItemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _topLayout(context),
              _contentLayout(),
              const Spacer(),
              _buttonLayout(),
              customHeight(20),
            ],
          )),
    );
  }

  _topLayout(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              height: 400,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(40)),
                child: Image.asset(widget.productDetails.productURL ?? "",
                    fit: BoxFit.cover),
              ),
            )),
        Positioned(
            child: _backButton(context),
            top: MediaQuery.of(context).viewPadding.top + 20,
            left: 20),
        Positioned(
            child: _diffColorSwitch(),
            top: MediaQuery.of(context).viewPadding.top + 100,
            left: 16),
        Positioned(
            bottom: 20,
            right: 20,
            child: Icon(
              CupertinoIcons.viewfinder_circle,
              color: Colors.grey.shade400,
              size: 32,
            ))
      ],
    );
  }

  _contentLayout() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.productDetails.productName ?? '', style: titleTestStyle),
          customHeight(16),
          Row(
            children: [
              Expanded(
                child: Text(widget.productDetails.productPrice ?? '',
                    style: defaultTestStyle),
              ),
              _counter(),
            ],
          ),
          customHeight(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.star, color: Colors.yellow),
              customWeight(8),
              Text(widget.productDetails.productRatting.toString(),
                  style: defaultTestStyle),
              customWeight(20),
              Text("( ${widget.productDetails.productReview} Reviews)")
            ],
          ),
          customHeight(16),
          Text(widget.productDetails.productDescription ?? "",
              style: defaultTestStyle),
        ],
      ),
    );
  }

  _backButton(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
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
          )),
    );
  }

  _diffColorSwitch() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: .5,
            blurRadius: 7,
            offset: const Offset(0, 1), // changes position of shadow
          )
        ],
      ),
      child: Column(children: List.generate(3, (index) => _switchCard(index))),
    );
  }

  _switchCard(int index) {
    return Column(
      children: [
        customHeight(8),
        InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: 7,
                  offset: const Offset(0, 1), // changes position of shadow
                )
              ],
              border: selectedIndex == index
                  ? Border.all(
                      width: 5,
                      color: Colors.grey.shade400,
                      strokeAlign: BorderSide.strokeAlignCenter)
                  : null,
              color: colorsList[index],
              shape: BoxShape.circle,
            ),
          ),
        ),
        customHeight(8)
      ],
    );
  }

  _counter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              addedItemCount += 1;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: 7,
                  offset: const Offset(0, 1), // changes position of shadow
                )
              ],
            ),
            child: const Icon(Icons.add, size: 16),
          ),
        ),
        customWeight(16),
        Text(addedItemCount.toString().padLeft(2, "0"),
            style: defaultTestStyle),
        customWeight(16),
        InkWell(
          onTap: () {
            setState(() {
              if (addedItemCount != 0) addedItemCount -= 1;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: .5,
                  blurRadius: 7,
                  offset: const Offset(0, 1), // changes position of shadow
                )
              ],
            ),
            child: const Icon(Icons.remove, size: 16),
          ),
        ),
      ],
    );
  }

  _buttonLayout() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade300,
              ),
              child: const Icon(Icons.bookmark_border, size: 12),
            ),
          ),
          customWeight(20),
          Expanded(
            child: customButton(
                buttonColor: Colors.black,
                buttonText: "Add to cart",
                onButtonClick: () {},
                textColor: Colors.white),
          )
        ],
      ),
    );
  }
}
