import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:ows_myshopline_retailer/constants/products.dart';
import 'card_best_selling_deals.dart';
import 'package:ows_myshopline_retailer/constants/colors.dart';
import 'package:ows_myshopline_retailer/constants/constants.dart';

class LowSellingItems extends StatefulWidget {
  const LowSellingItems({Key? key}) : super(key: key);

  @override
  State<LowSellingItems> createState() => _LowSellingItemsState();
}

class _LowSellingItemsState extends State<LowSellingItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .47,
      height: MediaQuery.of(context).size.height * .25,
      color: Colors.grey.shade300,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              width: MediaQuery.of(context).size.width * .4,
              height: MediaQuery.of(context).size.height * .25,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: products2.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Center(
                          child: InkWell(
                            child: TodayDealsCard(
                              image: products2[index]['image'],
                              details: products2[index]['detail'],
                              productName: products2[index]['name'],
                            ),
                            onTap: () async {
                              alertDialog(context, products2[index],true);
                            },
                          ),
                        ),
                        SizedBox(width: 2,)
                      ],
                    );
                  })),
        ),
      ),
    );
  }

  alertDialog(BuildContext context, var products, bool getBestPrice) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                content: Container(
                  height: 420,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .7,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.close))
                        ],
                      ),
                      Container(
                        height: 170,
                        child: Image.network(products['image']!),
                      ),
                      Divider(),
                      Row(
                        children: [
                          Container(
                            height: 25,
                            color: Colors.pink,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: Text(
                                  '70% off',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            child: Center(
                              child: Text('on Chat'),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            height: 25,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Center(
                                child: Text(
                                  'Rs 299/-',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Center(
                                child: Row(
                                  children: [
                                    Text(
                                      'MRP: ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      'RS-499',
                                      style: TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4.0),
                              child: Center(
                                child: Text(
                                  products['name']!,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Center(
                                child: Text(
                                  'Sold By: RCM Mobiles',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      getBestPrice ? Container(
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: AppColors.defaultColor,
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              if (mounted) {
                                setState(() {
                                  getBestPrice = false;
                                });
                              }
                            },
                            child: Text('Get Best Price')),
                      ) : Container(),
                      getBestPrice ? Container() : Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: AppColors.defaultColor,
                                    textStyle: TextStyle(
                                        fontSize: 36, fontWeight: FontWeight.bold)),
                                onPressed: () {},
                                child: Icon(Icons.phone)),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: AppColors.defaultColor,
                                    textStyle: TextStyle(
                                        fontSize: 36, fontWeight: FontWeight.bold)),
                                onPressed: () {},
                                child: Icon(Icons.whatsapp)),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: AppColors.defaultColor,
                                    textStyle: TextStyle(
                                        fontSize: 36, fontWeight: FontWeight.bold)),
                                onPressed: () {},
                                child: Icon(Icons.chat_bubble_outline)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
        );
      },
    );
  }
}
