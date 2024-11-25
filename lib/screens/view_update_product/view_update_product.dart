import 'package:flutter/material.dart';
import 'package:ows_myshopline_retailer/constants/products.dart';
import 'card_product_update.dart';

class ViewUpdateProduct extends StatefulWidget {
  const ViewUpdateProduct({Key? key}) : super(key: key);
  @override
  State<ViewUpdateProduct> createState() => _ViewUpdateProductState();
}

class _ViewUpdateProductState extends State<ViewUpdateProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: products2.length,
                    itemBuilder: (context, index) {
                      return CardProductUpdate( product: products2[index],);
                    })),

          ],
        ),
      ),
    );
  }
}
