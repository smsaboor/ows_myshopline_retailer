import 'package:flutter/material.dart';
import 'best_selling_item.dart';
import 'low_selling_item.dart';

class SellingItems extends StatelessWidget {
  const SellingItems({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('Best Selling Items',style: TextStyle(fontWeight: FontWeight.w500),)),
          ),
          BestSellingItems(),
        ],
      ),
      SizedBox(width: 10,),
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text('Low Selling Items',style: TextStyle(fontWeight: FontWeight.w500),)),
          ),
          LowSellingItems(),
        ],
      )
    ],);
  }
}
