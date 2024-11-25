import 'package:flutter/material.dart';
import 'package:ows_myshopline_retailer/constants/components.dart';

class ButtonNext extends StatefulWidget {
  const ButtonNext({Key? key,this.navigatePage}) : super(key: key);
  final navigatePage;
  @override
  State<ButtonNext> createState() => _ButtonNextState();
}

class _ButtonNextState extends State<ButtonNext> {
  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth * .8,
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: defaultButton(
            function: () {
              navigateTo(context,widget.navigatePage);
            },
            text: 'Next >>'.toUpperCase(),
            radius: 30,
            isUpperCase: false,
            fontColor: Colors.white,
            borderWidth: 1,
            backgroundColor: Colors.pink),
      ),
    );
  }
}
