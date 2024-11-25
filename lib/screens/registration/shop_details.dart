import 'package:flutter/material.dart';
import 'header_shop_details.dart';
import 'body_shop_details.dart';

class ShopDetails extends StatefulWidget {
  const ShopDetails({Key? key}) : super(key: key);

  @override
  State<ShopDetails> createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderShopDetails(),
            BodyShopDetails(),
          ],
        ),
      ),
    );
  }
}
