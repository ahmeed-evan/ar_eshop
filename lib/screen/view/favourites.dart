import 'package:ar_e_shop/util/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width,
          child: Text(
            "Add All to Cart",
            textAlign: TextAlign.center,
            style: smallTestStyle.copyWith(color: Colors.white),
          )),
      body: SafeArea(child: _body()),
    );
  }

  _body() {
    return Column(
      children: [
        _appBar(),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(),
              );
            },
            itemBuilder: (context, index) => _itemCard(index),
            shrinkWrap: true,
            itemCount: productList.length,
          ),
        )
      ],
    );
  }

  _appBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(CupertinoIcons.search),
          Text(
            "Favourites",
            style: defaultTestStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Icon(CupertinoIcons.cart),
        ],
      ),
    );
  }

  _itemCard(int index) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(productList[index].productURL!,
                width: 120, height: 150, fit: BoxFit.fill),
          ),
          customWeight(20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(productList[index].productName!,
                  style: smallTestStyle.copyWith(color: Colors.grey)),
              customHeight(10),
              Text("\$ ${productList[index].productPrice!}",
                  style: defaultTestStyle),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.cancel_outlined,
                  color: Colors.black,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.all(10),
                  child: const Icon(CupertinoIcons.bag, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
