import 'package:ar_e_shop/category.dart';
import 'package:ar_e_shop/main.dart';
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
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 100,
        itemBuilder: (context, index) => _productCard(),
      ),
    );
  }

  _productCard() {
    return Column(
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/Mask Group.png'))
          ),
        )
        // Image(image: AssetImage("assets/images/Mask Group.png"))
      ],
    );
  }
}
