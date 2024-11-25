import 'package:flutter/material.dart';
import 'header_shop_category.dart';
import 'body_shop_category.dart';

class SelectShopCategory extends StatefulWidget {
  const SelectShopCategory({Key? key}) : super(key: key);
  @override
  State<SelectShopCategory> createState() => _SelectShopCategoryState();
}

class _SelectShopCategoryState extends State<SelectShopCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                BodyShopCategory(),
                HeaderShopCategory(),
                Positioned(
                  top: MediaQuery.of(context).size.height * .25,
                  left: MediaQuery.of(context).size.width * .1,
                  child: Container(
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black,width: .1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),),
                    ),
                    height: MediaQuery.of(context).size.height * .06,
                    width: MediaQuery.of(context).size.width * .8,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                          child: Text(
                            'Select Your Shop Category'.toUpperCase(),
                            style: const TextStyle(
                                fontSize: 18,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          )),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
