import 'package:flutter/material.dart';
import 'header_shop_type.dart';
import 'body_shop_type.dart';

class SelectShopType extends StatefulWidget {
  const SelectShopType({Key? key}) : super(key: key);
  @override
  State<SelectShopType> createState() => _SelectShopTypeState();
}

class _SelectShopTypeState extends State<SelectShopType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const BodyShopType(),
                const HeaderShopType(),
                Positioned(
                  top: MediaQuery.of(context).size.height * .27,
                  left: MediaQuery.of(context).size.width * .1,
                  child: Container(
                    decoration:  BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black,width: .1),
                      borderRadius: const BorderRadius.all(
                         Radius.circular(10.0),),
                    ),
                    height: MediaQuery.of(context).size.height * .06,
                    width: MediaQuery.of(context).size.width * .8,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Center(
                          child: Text(
                            'Select Your Shop Type'.toUpperCase(),
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
