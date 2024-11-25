import 'package:flutter/material.dart';

class ButtonLocationReceiveEnquiry extends StatefulWidget {
  const ButtonLocationReceiveEnquiry({Key? key,required this.fontSize,required this.text,required this.boolValue,required this.onTab}) : super(key: key);
final text;
final boolValue;
final onTab;
final fontSize;
  @override
  State<ButtonLocationReceiveEnquiry> createState() => _ButtonLocationReceiveEnquiryState();
}

class _ButtonLocationReceiveEnquiryState extends State<ButtonLocationReceiveEnquiry> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .4,
      child: Card(
        elevation: 10,
        color: widget.boolValue ? Colors.green : Colors.black38,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(color: Colors.white),
        ),
        child: InkWell(
          onTap: widget.onTab,
          child: Row(
            children: [
              Checkbox(
                value: widget.boolValue ? true : false,
                checkColor: Colors.black,
                activeColor: Colors.white,
                side: BorderSide(
                  color: Colors.white,
                  width: 1.5,
                ),
                onChanged: (bool? value) {},
              ),
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Text(
                  widget.text,
                  style: TextStyle(color: Colors.white,fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
