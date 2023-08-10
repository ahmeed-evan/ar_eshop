import 'package:ar_e_shop/domain/category.dart';
import 'package:ar_e_shop/main.dart';
import 'package:ar_e_shop/domain/product_details.dart';
import 'package:ar_e_shop/screen/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final List<Category> iconList = [
    Category(
        "Popular",
        Icon(CupertinoIcons.star,
            color: Colors.black.withOpacity(.4), size: 30)),
    Category("Chair",
        Icon(Icons.chair_alt, color: Colors.black.withOpacity(.4), size: 30)),
    Category(
        "Table",
        Icon(Icons.table_restaurant,
            color: Colors.black.withOpacity(.4), size: 30)),
    Category("Sofa",
        Icon(Icons.chair_sharp, color: Colors.black.withOpacity(.4), size: 30)),
    Category(
        "Bed", Icon(Icons.bed, color: Colors.black.withOpacity(.4), size: 30)),
    Category("Lamp",
        Icon(Icons.light, color: Colors.black.withOpacity(.4), size: 30)),
  ];

  final List<ProductDetails> productList = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _body()),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topLayout(),
          _contentLayout(),
        ],
      ),
    );
  }

  _topLayout() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(CupertinoIcons.search, color: Colors.grey, size: 24),
          Column(
            children: [
              Text("Make Home",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  )),
              Text("BEAUTIFUL",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      letterSpacing: .3)),
            ],
          ),
          Icon(CupertinoIcons.cart, color: Colors.grey, size: 24),
        ],
      ),
    );
  }

  _contentLayout() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        _productCategory(),
        _productList(),
      ]),
    );
  }

  _productCategory() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          separatorBuilder: (context, index) => customWeight(16),
          itemBuilder: (context, index) => _iconCategoryView(index),
          itemCount: iconList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal),
    );
  }

  Widget _iconCategoryView(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: iconList[index].categoryIcon,
        ),
        customHeight(10),
        Text(
          iconList[index].categoryName,
          style: TextStyle(
              color: Colors.black.withOpacity(.4),
              fontSize: 16,
              letterSpacing: .2),
        )
      ],
    );
  }

  _productList() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productList.length,
      itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                        productDetails: productList[index],
                      )),
            );
          },
          child: _productCard(index)),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        childAspectRatio: .6,
      ),
    );
  }

  _productCard(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(productList[index].productURL ?? ""),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: .5,
                          blurRadius: 7,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ]),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.grey.shade400,
                  )),
            ),
          ],
        ),
        customHeight(10),
        Text(productList[index].productName ?? ""),
        customHeight(10),
        Text(productList[index].productPrice ?? ""),
      ],
    );
  }
}
