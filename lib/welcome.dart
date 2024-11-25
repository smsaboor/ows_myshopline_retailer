import 'package:flutter/material.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:ows_myshopline_retailer/constants/components.dart';
import 'package:ows_myshopline_retailer/screens/registration/select_shop_type.dart';
import 'package:ows_myshopline_retailer/screens/login/login2.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/img.png',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .65,
          child: Container(
            height: MediaQuery.of(context).size.height * .35,
            width: MediaQuery.of(context).size.width,
            child: ClipPath(
              clipper: ProsteBezierCurve(
                position: ClipPosition.top,
                list: [
                  BezierCurveSection(
                    start: Offset(screenWidth, 0),
                    top: Offset(screenWidth / 4 * 3, 30),
                    end: Offset(screenWidth / 2, 30),
                  ),
                  BezierCurveSection(
                    start: Offset(screenWidth / 2, 20),
                    top: Offset(screenWidth / 4, 10),
                    end: Offset(0, 30),
                  ),
                ],
              ),
              child: Container(
                color: Colors.black87,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .1,
                      ),
                      Center(
                          child: Text(
                        'MyShopLine'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 28,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      )),
                      SizedBox(height: 10,),
                      SizedBox(
                        width: screenWidth * .6,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: defaultButton(
                              function: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => LoginScreen()));
                              },
                              text: 'Login'.toUpperCase(),
                              radius: 30,
                              borderColor: Colors.white,
                              isUpperCase: false,
                              fontColor: Colors.white,
                              borderWidth: .2,
                              backgroundColor: Colors.pink),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: screenWidth * .6,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: defaultButton(
                              function: () {
                                navigateTo(context,SelectShopType());
                              },
                              text: 'Registration'.toUpperCase(),
                              radius: 30,
                              borderColor: Colors.black,
                              isUpperCase: false,
                              fontColor: Colors.pink,
                              borderWidth: 1,
                              backgroundColor: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ) // Front// Front image
      ],
    );
  }
}

class Clipp extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(150, 0);
    path.quadraticBezierTo(0, 90, 0, 0);
    path.lineTo(0, 300);
    path.quadraticBezierTo(size.width / 4, size.height, size.width, 280);
    path.lineTo(size.width, 20);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
