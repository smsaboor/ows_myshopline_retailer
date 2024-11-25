import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'header_shop_location.dart';
import 'body_shop_location.dart';

class ShopLocation extends StatefulWidget {
  const ShopLocation({Key? key}) : super(key: key);
  @override
  State<ShopLocation> createState() => _ShopLocationState();
}

class _ShopLocationState extends State<ShopLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderShopLocation(),
            BodyShopLocation(),
          ],
        ),
      ),
    );
  }
}
