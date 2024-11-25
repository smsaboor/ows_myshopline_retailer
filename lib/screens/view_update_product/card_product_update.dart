import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ows_myshopline_retailer/constants/colors.dart';
import 'package:ows_myshopline_retailer/core/widgets/custom_snackbaar.dart';

class CardProductUpdate extends StatefulWidget {
  const CardProductUpdate({Key? key, required this.product}) : super(key: key);
  final product;
  @override
  State<CardProductUpdate> createState() => _CardProductUpdateState();
}

class _CardProductUpdateState extends State<CardProductUpdate> {
  bool _switchValue3 = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5, bottom: 5),
      child: Container(
        height: 130,
        child: Card(
          color: Colors.white,
          elevation: .2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .2,
                child: SizedBox(
                    height: 60,
                    width: 60,
                    child: Image.network(widget.product['image'])),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product['name'],
                        style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text('MRP: Rs 300',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: Colors.pink)),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Display Price ?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black)),
                          Column(
                            children: [
                              SizedBox(
                                height: 20, //set desired REAL HEIGHT
                                width: 55,
                                child: Transform.scale(
                                  scale: 0.9,
                                  child: CupertinoSwitch(
                                    value: _switchValue3,
                                    trackColor: Colors.red,
                                    activeColor: Colors.green,
                                    onChanged: (value) {
                                      setState(() {
                                        _switchValue3 = !_switchValue3;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('No    Yes', style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black)),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .25,
                child: SizedBox(
                  height: 39,
                  width: 40,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                      side: BorderSide(color: Colors.indigo)))),
                      onPressed: () {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        CustomSnackBar.snackBar(
                            context: context,
                            data: 'Price Added Successfully!',
                            color: Colors.green);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Set your\n   price".toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.red)),
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
