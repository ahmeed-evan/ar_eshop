import 'package:ar_e_shop/screen/view/home.dart';
import 'package:ar_e_shop/util/utils.dart';
import 'package:flutter/material.dart';

import '../../util/images.dart';

class AppEntry extends StatelessWidget {
  const AppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Images.bgEntryImage), fit: BoxFit.cover),
      ),
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "make your".toUpperCase(),
            style: titleTestStyle.copyWith(color: Colors.grey.shade500),
          ),
          customHeight(16),
          Text(
            "HOME BEAUTIFUL".toUpperCase(),
            style: titleTestStyle.copyWith(fontSize: 30),
          ),
          Container(
            margin: const EdgeInsets.all(40),
            child: Text(
              "The best simple place where you discover most wonderful furnitures and make your home beautiful"
                  .toUpperCase(),
              style: defaultTestStyle.copyWith(fontWeight: FontWeight.w300),
            ),
          ),
          customHeight(70),
          Center(
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(),));
              },
              child: Container(
                width: 200,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.black, borderRadius: BorderRadius.circular(16)),
                child: Text(
                  "Get Started",
                  textAlign: TextAlign.center,
                  style: defaultTestStyle.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
