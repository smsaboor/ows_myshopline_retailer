import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({Key? key,this.selectedIndex}) : super(key: key);
final selectedIndex;
  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 5,
      child: SizedBox(
        height: 20,
        width: 20,
        child: Checkbox(
          activeColor: Colors.green,
          value: widget.selectedIndex ? true : false,
          onChanged: (value) {
            setState(() {
            });
          },
        ),
      ),
    );
  }
}
