import 'package:flutter/material.dart';
import 'header_product_price.dart';
import 'body_product_price.dart';

class SelectProductPrice extends StatefulWidget {
  const SelectProductPrice({Key? key}) : super(key: key);
  @override
  State<SelectProductPrice> createState() => _SelectProductPriceState();
}

class _SelectProductPriceState extends State<SelectProductPrice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderProductPrice(),
            BodyProductPrice(gape: .02,nav: 1,),
          ],
        ),
      ),
    );
  }
}
