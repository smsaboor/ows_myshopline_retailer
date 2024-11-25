import 'package:flutter/material.dart';
import 'package:ows_myshopline_retailer/constants/components.dart';
import 'package:ows_myshopline_retailer/screens/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'widgets/check_box_product_price.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BodyProductPrice extends StatefulWidget {
  const BodyProductPrice({Key? key, required this.gape, required this.nav})
      : super(key: key);
  final gape;
  final nav;
  @override
  State<BodyProductPrice> createState() => _BodyProductPriceState();
}

class _BodyProductPriceState extends State<BodyProductPrice> {
  bool isHindi = true;
  int selectedIndexP1 = 1;
  int selectedIndexP2 = 1;
  int selectedIndexP3 = 1;
  int selectedIndexP4 = 1;
  int selectedIndexP5 = 1;
  int selectedIndex = 1;
  bool valueCheck = true;

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * widget.gape,
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 24.0, right: 24, bottom: 10, top: 15),
          child: Row(
            children: const [
              Text(
                "Is your Product Price Fixed ? ",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CheckBoxProductPrice(
              title: 'Fixed Price Shop',
              selectedIndex: selectedIndexP1,
              matchIndex: 1,
              onTapFunction: () {
                if (mounted) {
                  setState(() {
                    selectedIndexP1 = 1;
                  });
                }
              },
            ),
            CheckBoxProductPrice(
              title: 'Price not Fixed',
              selectedIndex: selectedIndexP1,
              matchIndex: 2,
              onTapFunction: () {
                if (mounted) {
                  setState(() {
                    selectedIndexP1 = 2;
                  });
                }
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 24.0, right: 24, bottom: 10, top: 15),
          child: Row(
            children: const [
              Text(
                "Do you want to show product price to buyers",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CheckBoxProductPrice(
              title: 'Show Price',
              selectedIndex: selectedIndexP2,
              matchIndex: 1,
              onTapFunction: () {
                if (mounted) {
                  setState(() {
                    selectedIndexP2 = 1;
                  });
                }
              },
            ),
            CheckBoxProductPrice(
              title: 'Contact for Price',
              selectedIndex: selectedIndexP2,
              matchIndex: 2,
              onTapFunction: () {
                if (mounted) {
                  setState(() {
                    selectedIndexP2 = 2;
                  });
                }
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 24.0, right: 24, bottom: 10, top: 15),
          child: Row(
            children: const [
              Text(
                "Are you accepting credit card payments ?",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CheckBoxProductPrice(
              title: 'Yes',
              selectedIndex: selectedIndexP3,
              matchIndex: 1,
              onTapFunction: () {
                if (mounted) {
                  setState(() {
                    selectedIndexP3 = 1;
                  });
                }
              },
            ),
            CheckBoxProductPrice(
              title: 'No',
              selectedIndex: selectedIndexP3,
              matchIndex: 2,
              onTapFunction: () {
                if (mounted) {
                  setState(() {
                    selectedIndexP3 = 2;
                  });
                }
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 24.0, right: 24, bottom: 10, top: 15),
          child: Row(
            children: const [
              Text(
                "Are you Providing EMI's for purchses ?",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CheckBoxProductPrice(
              title: 'Yes',
              selectedIndex: selectedIndexP4,
              matchIndex: 1,
              onTapFunction: () {
                if (mounted) {
                  setState(() {
                    selectedIndexP4 = 1;
                  });
                }
              },
            ),
            CheckBoxProductPrice(
              title: 'No',
              selectedIndex: selectedIndexP4,
              matchIndex: 2,
              onTapFunction: () {
                if (mounted) {
                  setState(() {
                    selectedIndexP4 = 2;
                  });
                }
              },
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 24.0, right: 24, bottom: 10, top: 15),
          child: Row(
            children: const [
              Text(
                "Questions ?",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CheckBoxProductPrice(
              title: 'Yes',
              selectedIndex: selectedIndexP5,
              matchIndex: 1,
              onTapFunction: () {
                if (mounted) {
                  setState(() {
                    selectedIndexP5 = 1;
                  });
                }
              },
            ),
            CheckBoxProductPrice(
              title: 'No',
              selectedIndex: selectedIndexP5,
              matchIndex: 2,
              onTapFunction: () {
                if (mounted) {
                  setState(() {
                    selectedIndexP5 = 2;
                  });
                }
              },
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        widget.nav == 2
            ? SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: defaultButton(
                      function: () {
                        // navigateTo(context, CommonContainer(title: 'Submitted',));
                      },
                      text: 'Submit'.toUpperCase(),
                      radius: 30,
                      isUpperCase: false,
                      fontColor: Colors.white,
                      borderWidth: 1,
                      backgroundColor: Colors.pink),
                ),
              )
            : SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: defaultButton(
                      function: () async{
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        preferences.setBool('isLogin', true);
                        navigateAndFinsh(context, HomeScreen());
                      },
                      text: 'Submit'.toUpperCase(),
                      radius: 30,
                      isUpperCase: false,
                      fontColor: Colors.white,
                      borderWidth: 1,
                      backgroundColor: Colors.pink),
                ),
              )
      ],
    );
  }
}
