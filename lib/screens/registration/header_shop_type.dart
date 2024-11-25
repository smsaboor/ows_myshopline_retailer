import 'package:flutter/material.dart';

class HeaderShopType extends StatefulWidget {
  const HeaderShopType({Key? key}) : super(key: key);
  @override
  State<HeaderShopType> createState() => _HeaderShopTypeState();
}

class _HeaderShopTypeState extends State<HeaderShopType> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return  Container(
      height: height * .30,
      width: width,
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
              height: height * .07,
            ),
            Center(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('MyShopLine'.toUpperCase(),
                      style: TextStyle(
                          fontSize: height * .04,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                )),
            Center(
                child: Container(
                  width: MediaQuery.of(context).size.width*.9,
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.all(
                       Radius.circular(10.0),),
                  ),
                  child: Column(
                    children: [
                     Padding(
                       padding: const EdgeInsets.all(5.0),
                       child: const Text(
                          'We Make it easy to sell your product online',
                          style:TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                     ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'And Its Free'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 20,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),

                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
