import 'package:flutter/material.dart';

class HeaderShopCategory extends StatefulWidget {
  const HeaderShopCategory({Key? key}) : super(key: key);
  @override
  State<HeaderShopCategory> createState() => _HeaderShopCategoryState();
}

class _HeaderShopCategoryState extends State<HeaderShopCategory> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height * .28,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/img_2.png'),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .07,
            ),
            Center(
                child: Container(
                  color: Colors.black45,
                  child: Text('MyShopLine'.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 28,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
