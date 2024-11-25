import 'package:flutter/material.dart';

class ButtonSelectShop extends StatefulWidget {
  const ButtonSelectShop({Key? key,this.title, this.selctedIndex,this.onTap}) : super(key: key);
  final selctedIndex;
  final onTap;
  final title;
  @override
  State<ButtonSelectShop> createState() => _ButtonSelectShopState();
}

class _ButtonSelectShopState extends State<ButtonSelectShop> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 10.0, right: 5, bottom: 5, top: 5),
      child: SizedBox(
        height: MediaQuery.of(context).size.width * .3,
        width: MediaQuery.of(context).size.width * .4,
        child: Card(
          elevation: 10,
          color: widget.selctedIndex
              ? Colors.green
              : Colors.black38,
          shape: const RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.white),
          ),
          child: InkWell(
            onTap: widget.onTap,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.title.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
