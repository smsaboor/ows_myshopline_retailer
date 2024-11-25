import 'package:flutter/material.dart';

class CheckBoxProductPrice extends StatefulWidget {
  const CheckBoxProductPrice(
      {Key? key, this.selectedIndex, this.title, this.matchIndex,this.onTapFunction})
      : super(key: key);
  final selectedIndex;
  final matchIndex;
  final title;
  final onTapFunction;

  @override
  State<CheckBoxProductPrice> createState() => _CheckBoxProductPriceState();
}

class _CheckBoxProductPriceState extends State<CheckBoxProductPrice> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width * .45,
      height: 45,
      child: Card(
        elevation: 10,
        color: widget.selectedIndex == widget.matchIndex ? Colors.green : Colors.black38,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: Colors.white),
        ),
        child: InkWell(
          onTap: widget.onTapFunction,
          child: Row(
            children: [
              Transform.scale(
                scale: .9,
                child: Checkbox(
                  value: widget.selectedIndex == widget.matchIndex ? true : false,
                  checkColor: Colors.black,
                  activeColor: Colors.white,
                  side: BorderSide(
                    color: Colors.white,
                    width: 1.5,
                  ),
                  onChanged: (bool? value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  widget.title,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
