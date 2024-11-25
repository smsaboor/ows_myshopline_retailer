import 'package:flutter/material.dart';
import 'package:ows_myshopline_retailer/constants/components.dart';
import 'package:ows_myshopline_retailer/screens/add_product_nd_offer/add_new_producct.dart';

class SelectProductOptions extends StatefulWidget {
  const SelectProductOptions({Key? key}) : super(key: key);
  @override
  State<SelectProductOptions> createState() => _SelectProductOptionsState();
}

class _SelectProductOptionsState extends State<SelectProductOptions> {
  @override
  Widget build(BuildContext context) {
    final double height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: height*.001,right: height*.001,top: height*.001,bottom: height*.001),
              child: Container(
                height: 180,
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 28.0, top: 28, bottom: 28, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                              height: 40,
                              width: 40,
                              child: Icon(Icons.category,size: 30,color: Colors.red,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Add from Smart Catelogue',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                              SizedBox(height: 5,),
                              const Text(
                                  'Easily select the most polpular products \nyou sell from the smart catelouge',
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12)),
                              Padding(
                                padding: EdgeInsets.only(left: 0, top:height*.02),
                                child: SizedBox(
                                  height: 45,
                                  width: 180,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          foregroundColor:
                                          MaterialStateProperty.all<Color>(Colors.white),
                                          backgroundColor:
                                          MaterialStateProperty.all<Color>(Colors.white),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.zero,
                                                  side: BorderSide(color: Colors.indigo)))),
                                      onPressed: (){},
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 8.0,right: 8),
                                            child: Icon(Icons.touch_app,color: Colors.indigo,size: 20,),
                                          ),
                                          Text("Start Selecting".toUpperCase(),
                                              style: const TextStyle(fontSize: 12,color: Colors.indigo)),
                                        ],
                                      )),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: height*.001,right: height*.001,top: height*.001,bottom: height*.001),
              child: Container(
                height: 180,
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 28.0, top: 28, bottom: 28, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                              height: 40,
                              width: 40,
                              child: Icon(Icons.upload,size: 30,color: Colors.red,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Add via Bulk Upload',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                              SizedBox(height: 5,),
                              const Text(
                                  'if You Have a CSV No. of your products we will \nhelp you  bulk upload it to your online shop.',
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12)),
                              Padding(
                                padding: EdgeInsets.only(left: 0, top:height*.02),
                                child: SizedBox(
                                  height: 45,
                                  width: 180,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          foregroundColor:
                                          MaterialStateProperty.all<Color>(Colors.white),
                                          backgroundColor:
                                          MaterialStateProperty.all<Color>(Colors.white),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.zero,
                                                  side: BorderSide(color: Colors.indigo)))),
                                      onPressed: (){},
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 8.0,right: 8),
                                            child: Icon(Icons.chat_bubble_outline,color: Colors.indigo,size: 20,),
                                          ),
                                          Text("Contact Us".toUpperCase(),
                                              style: const TextStyle(fontSize: 12,color: Colors.indigo)),
                                        ],
                                      )),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: height*.001,right: height*.001,top: height*.001,bottom: height*.001),
              child: Container(
                height: 180,
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 28.0, top: 28, bottom: 28, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                              height: 40,
                              width: 40,
                              child: Icon(Icons.add_box,size: 30,color: Colors.red,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Add Custom Product',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17),
                              ),
                              const SizedBox(height: 5,),
                              const Text(
                                  'Have a new product that we dont have in our\nsystem? Easily add it to your online shop ',
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12)),
                              Padding(
                                padding:  EdgeInsets.only(left: 0, top:height*.02),
                                child: SizedBox(
                                  height: 45,
                                  width: 180,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                          foregroundColor:
                                          MaterialStateProperty.all<Color>(Colors.white),
                                          backgroundColor:
                                          MaterialStateProperty.all<Color>(Colors.white),
                                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.zero,
                                                  side: BorderSide(color: Colors.indigo)))),
                                      onPressed: (){
                                        navigateTo(context, AddNewProduct());
                                      },
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(left: 8.0,right: 8),
                                            child: Icon(Icons.add,color: Colors.indigo,size: 20,),
                                          ),
                                          Text("Custom product".toUpperCase(),
                                              style: const TextStyle(fontSize: 12,color: Colors.indigo)),
                                        ],
                                      )),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
