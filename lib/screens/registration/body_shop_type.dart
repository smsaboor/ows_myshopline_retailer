import 'package:flutter/material.dart';
import 'package:ows_myshopline_retailer/constants/colors.dart';
import 'package:ows_myshopline_retailer/core/widgets/custom_snackbaar.dart';
import 'package:ows_myshopline_retailer/screens/registration/select_shop_category.dart';
import 'widgets/button_select_shop.dart';
import 'widgets/checkbox.dart';
import 'widgets/button_next.dart';
import 'package:ows_myshopline_retailer/constants/components.dart';

class BodyShopType extends StatefulWidget {
  const BodyShopType({Key? key}) : super(key: key);

  @override
  State<BodyShopType> createState() => _BodyShopTypeState();
}

class _BodyShopTypeState extends State<BodyShopType> {
  bool isHindi = true;
  bool selectedIndex1 = false;
  bool selectedIndex2 = false;
  bool selectedIndex3 = false;
  bool selectedIndex4 = false;

  int totalSelectedTypes = 0;

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      height: sizeHeight,
      width: sizeWidth,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .38,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ButtonSelectShop(
                      title: 'retailer',
                      selctedIndex: selectedIndex1,
                      onTap: () {
                        if (mounted) {
                          setState(() {
                            selectedIndex1 = !selectedIndex1;
                          });
                        }
                      },
                    ),
                    selectedIndex1
                        ? CheckBox(
                            selectedIndex: selectedIndex1,
                          )
                        : Container(), //C
                  ],
                ),
                Stack(
                  children: [
                    ButtonSelectShop(
                      title: 'whole seller',
                      selctedIndex: selectedIndex2,
                      onTap: () {
                        if (mounted) {
                          setState(() {
                            selectedIndex2 = !selectedIndex2;
                          });
                        }
                      },
                    ),
                    selectedIndex2
                        ? CheckBox(
                            selectedIndex: selectedIndex2,
                          )
                        : Container(), //C
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ButtonSelectShop(
                      title: 'Distributter',
                      selctedIndex: selectedIndex3,
                      onTap: () {
                        if (mounted) {
                          setState(() {
                            selectedIndex3 = !selectedIndex3;
                          });
                        }
                      },
                    ),
                    selectedIndex3
                        ? CheckBox(
                            selectedIndex: selectedIndex3,
                          )
                        : Container(), //C
                  ],
                ),
                Stack(
                  children: [
                    ButtonSelectShop(
                      title: 'manufacturer',
                      selctedIndex: selectedIndex4,
                      onTap: () {
                        if (mounted) {
                          setState(() {
                            selectedIndex4 = !selectedIndex4;
                          });
                        }
                      },
                    ),
                    selectedIndex4
                        ? CheckBox(
                            selectedIndex: selectedIndex4,
                          )
                        : Container(), //C
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .1,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: defaultButton(
                    function: () {
                      validate();
                    },
                    text: 'Next >>'.toUpperCase(),
                    radius: 30,
                    isUpperCase: false,
                    fontColor: Colors.white,
                    borderWidth: 1,
                    backgroundColor: Colors.pink),
              ),
            ),
          ],
        ),
      ),
    );
  }

  validate() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    totalSelectedTypes=0;
    if (selectedIndex1 == true) totalSelectedTypes = totalSelectedTypes + 1;
    if (selectedIndex2 == true) totalSelectedTypes = totalSelectedTypes + 1;
    if (selectedIndex3 == true) totalSelectedTypes = totalSelectedTypes + 1;
    if (selectedIndex4 == true) totalSelectedTypes = totalSelectedTypes + 1;
    if (totalSelectedTypes == 0) {
      CustomSnackBar.snackBar(
          context: context,
          data: 'Please select at least 1 shop type',
          color: AppColors.error);
    } else if (totalSelectedTypes > 2) {
      CustomSnackBar.snackBar(
          context: context,
          data: 'Please select only 1 or 2 shop type',
          color: AppColors.error);
    } else {
      navigateTo(context, SelectShopCategory());
    }
  }
}
