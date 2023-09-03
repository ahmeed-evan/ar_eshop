import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/utils.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        ),
      ],
    );
  }

  _appBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(CupertinoIcons.back),
          const Spacer(),
          Text(
            "Favourites",
            style: defaultTestStyle.copyWith(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
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
          SizedBox(
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productList[index].productName!,
                    style: smallTestStyle.copyWith(color: Colors.grey)),
                customHeight(10),
                Text("\$ ${productList[index].productPrice!}",
                    style: defaultTestStyle),
                 const Spacer(),

              ],
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.cancel_outlined,
            color: Colors.black,
          ),
        ],
      ),
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
}
