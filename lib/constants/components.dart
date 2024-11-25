import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ows_myshopline_retailer/constants/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';



void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
void navigateAndFinsh(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (route) => false,
);

Widget defaultFormField(
        {required TextEditingController controller,
        required TextInputType type,
        Function? onSubmit,
        Function? onChange,
        bool isPassword = false,
        required String? Function(String? val)? validate,
        double radius = 0.0,
        required String label,
        IconData? prefix,
        IconData? suffix,
        Function? suffixPressed,
        bool isClickable = true,
        double width = double.infinity}) =>
    Container(
      width: width,
      height: 56,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        onFieldSubmitted: (e) {
          if (onSubmit != null) onSubmit(e);
        },
        onChanged: (s) {
          if (onChange != null) onChange(s);
        },
        validator: validate,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          errorStyle: TextStyle(
            color: Colors.amber,
          ),
          border: InputBorder.none,
          labelText: label,
          hintText: label,
          prefixIcon: Icon(
            prefix,
          ),
          hintStyle: TextStyle(
              fontFamily: 'Metropolis-Regular',
              fontSize: 16,
              color: AppColors.bgColorScreen),
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixPressed!();
                  },
                  icon: Icon(
                    suffix,
                  ),
                )
              : null,
        ),
      ),
    );



Widget defaultButton({
  double width = double.infinity,
  double height = 50,
  Color backgroundColor = AppColors.mainColor,
  Color borderColor = AppColors.mainColor,
  Color fontColor = Colors.white,
  bool isUpperCase = true,
  String fontFamily = 'Metropolis-SemiBold',
  double radius = 3.0,
  double borderWidth = 0,
  double fontSize = 18.0,
  required Function function,
  required String text,
  IconData? prefix,
}) =>
    Container(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)
            ),
            primary: backgroundColor
        ),
        onPressed: () {
          function();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefix != null)
              FaIcon(
                prefix,
                size: 20,
                color: Color(0xfff50505),
              ),
            if (prefix != null)
              SizedBox(
                width: 20,
              ),
            Text(
              isUpperCase ? text.toUpperCase() : text,
              style: TextStyle(
                  color: fontColor, fontSize: fontSize, fontFamily: fontFamily),
            ),
          ],
        ),
      ),
    );

IconButton cartIcon({required BuildContext context, Color color = AppColors.primaryFontColor}) {
  return IconButton(
    icon: Icon(
      FontAwesomeIcons.cartShopping,
      color: color,
      size: 25,
    ),
    onPressed: () {
      // navigateTo(context, CartScreen());
    },
  );
}



Widget mySeparator() => Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey[500],
    );
void showToast({
  required String msg,
}) async =>
    await Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Color.fromARGB(170, 195, 188, 188),
        textColor: Colors.deepOrange,
        fontSize: 16.0);
