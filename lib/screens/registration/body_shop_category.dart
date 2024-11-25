import 'package:flutter/material.dart';
import 'package:ows_myshopline_retailer/constants/colors.dart';
import 'package:ows_myshopline_retailer/constants/components.dart';
import 'package:ows_myshopline_retailer/core/widgets/custom_snackbaar.dart';
import 'package:ows_myshopline_retailer/screens/registration/shop_details.dart';
import 'widgets/button_shop_category.dart';
import 'package:ows_myshopline_retailer/constants/constants.dart';

class BodyShopCategory extends StatefulWidget {
  const BodyShopCategory({Key? key}) : super(key: key);
  @override
  State<BodyShopCategory> createState() => _BodyShopCategoryState();
}

class _BodyShopCategoryState extends State<BodyShopCategory> {
  bool isHindi = true;
  int selectedIndex1 = 0;
  int selectedIndex2 = 0;
  bool selectedIndexF=false;
bool isVerify=false;
  List<bool> boolListOne = [];
  List<bool> boolListTwo = [];
  getValues(){
    for(int i=0;i<stores.length;i++){
      boolListOne.add(false);
    }
    for(int i=0;i<stores.length;i++){
      boolListTwo.add(false);
    }
    reverseStores=stores.reversed.toList();
  }
var reverseStores;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValues();
  }
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
            SizedBox(height: MediaQuery.of(context).size.height * .35,
            ),
            SizedBox(
              height: sizeHeight * .01,
            ),
            Container(
                height: sizeHeight * .23,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: stores.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          if (mounted) {
                            setState(() {
                              // selectedIndexF=!selectedIndexF;
                              boolListOne[index]=!boolListOne[index];
                            });
                          }
                        },
                        child: ButtonSelectShopCategory(
                          title: 'Grocery',
                          shop: stores[index],
                          mainIndex: index,
                          selctedIndex: boolListOne[index],
                        ),
                      );
                    })),
            SizedBox(
              height: sizeHeight * .01,
            ),
            Container(
                height: sizeHeight * .23,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: reverseStores.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap:() {
                          setState(() {
                            boolListTwo[index]=!boolListTwo[index];
                          });
                      },
                        child: ButtonSelectShopCategory(
                          title: 'Grocery',
                          shop: reverseStores[index],
                          mainIndex: index,
                          selctedIndex: boolListTwo[index],
                        ),
                      );
                    })),
            SizedBox(
              height: sizeHeight * .03
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

  int countBoolList(List<bool> boolList) {
    int count = 0;
    for (int i = 0; i < boolList.length; i++) {
      if (boolList.elementAt(i) == true) {
        count++;
      }
    }
    return count;
  }

  validate() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (countBoolList(boolListOne)+countBoolList(boolListTwo)==0) {
      CustomSnackBar.snackBar(
          context: context,
          data: 'Please select 1 or more shop category',
          color: AppColors.error);
    }  else {
      navigateTo(context, const ShopDetails());
    }
  }



}
