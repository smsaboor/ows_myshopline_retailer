import 'package:flutter/material.dart';

class HeaderShopDetails extends StatefulWidget {
  const HeaderShopDetails({Key? key}) : super(key: key);
  @override
  State<HeaderShopDetails> createState() => _HeaderShopDetailsState();
}

class _HeaderShopDetailsState extends State<HeaderShopDetails> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height * .32,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .28,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/img_2.png'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0)),
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
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .25,
            left: MediaQuery.of(context).size.width * .1,
            child: Container(
              decoration:  BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black,width: .1),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),),
              ),
              height: MediaQuery.of(context).size.height * .06,
              width: MediaQuery.of(context).size.width * .8,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                    child: Text(
                      'Fill  Your Shop Details'.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 18,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
