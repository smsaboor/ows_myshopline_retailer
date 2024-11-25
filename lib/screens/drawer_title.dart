import 'package:flutter/material.dart';
import 'theme.dart';

class DrawerTile extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Function() onTap;
  final bool? isSelected;
  final Color iconColor;

  DrawerTile(
      {this.title,
        this.icon,
        required this.onTap,
        this.isSelected = false,
        this.iconColor = ArgonColors.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*.06,
              padding: EdgeInsets.only(left: 12,top: 8,bottom: 8),
              decoration: BoxDecoration(
                  color: isSelected! ? ArgonColors.white : ArgonColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(title!,
                        style: TextStyle(
                            letterSpacing: .3,
                            fontSize: 15,
                            color: isSelected!
                                ? Color.fromRGBO(0, 0, 0, 0.7)
                                : Color.fromRGBO(0, 0, 0, 0.7))),
                  ),
                  Spacer(),
                  Icon(icon,
                      size: 20, color: isSelected! ? iconColor : iconColor),
                ],
              )),
          Divider(thickness: .1,
          color: Colors.black38,
          height: 2,
          )
        ],
      ),
    );
  }
}
