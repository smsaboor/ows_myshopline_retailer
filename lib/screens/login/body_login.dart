import 'package:flutter/material.dart';
import 'package:ows_myshopline_retailer/constants/colors.dart';
import 'package:ows_myshopline_retailer/constants/components.dart';
import 'package:ows_myshopline_retailer/core/components.dart';
import 'package:ows_myshopline_retailer/core/widgets/custom_snackbaar.dart';
import 'package:ows_myshopline_retailer/providers/auth_provider.dart';
import 'package:ows_myshopline_retailer/screens/home_screen.dart';
import 'package:ows_myshopline_retailer/core/widgets/custom_form_field.dart';
import 'package:ows_myshopline_retailer/screens/widgets/loading_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BodyLogin extends StatefulWidget {
  const BodyLogin({Key? key}) : super(key: key);
  @override
  State<BodyLogin> createState() => _BodyLoginState();
}

class _BodyLoginState extends State<BodyLogin> {
  bool isHindi = true;
  int selectedIndex = 0;
  bool isVerify=true;

  TextEditingController _controllerMobile = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();


  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = new GlobalKey<FormState>();


  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  late FocusNode text1, text2, text3, text4;
  bool isVerifyOtp=false;

  @override
  void initState() {
    super.initState();
    text1 = FocusNode();
    text2 = FocusNode();
    text3 = FocusNode();
    text4 = FocusNode();
  }

  @override
  void dispose() {
    text1.dispose();
    text2.dispose();
    text3.dispose();
    text4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.authenticateError:
        Fluttertoast.showToast(msg: "Sign in fail");
        break;
      case Status.authenticateCanceled:
        Fluttertoast.showToast(msg: "Sign in canceled");
        break;
      case Status.authenticated:
        Fluttertoast.showToast(msg: "Sign in success");
        break;
      default:
        break;
    }
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      height: sizeHeight*.78,
      width: sizeWidth,
      color: Colors.white,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .1,
            ),
            SizedBox(
              height:60,
              child: CustomFormField(
                  maxLine: 1,
                  autoFocus: false,
                  controlller: _controllerMobile,
                  errorMsg: 'Enter Mobile',
                  labelText: 'Mobile Number',
                  readOnly: false,
                  icon: Icons.home_work_outlined,
                  maxLimit: 10,
                  maxLimitError: '10',
                  textInputType: TextInputType.number),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 60,
              child: CustomFormField(
                  maxLine: 1,
                  autoFocus: false,
                  controlller: _controllerPassword,
                  errorMsg: 'Enter Password',
                  labelText: 'Password',
                  readOnly: false,
                  icon: Icons.home,
                  maxLimit: 8,
                  maxLimitError: '8',
                  textInputType: TextInputType.number),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .05,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .8,
              height: 55,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: defaultButton(
                    function: () {
                      validate();
                    },
                    text: 'Next >>'.toUpperCase(),
                    radius: 30,
                    isUpperCase: false,
                    fontColor: Colors.white,
                    borderWidth: 1,
                    backgroundColor: Colors.pink),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .03,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: defaultButton(
                  function: () {
                    authProvider.handleSignIn().then((isSuccess) {
                      if (isSuccess) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      }
                    }).catchError((error, stackTrace) {
                      Fluttertoast.showToast(msg: error.toString());
                      authProvider.handleException();
                    });
                  },
                  text: 'Sign in with Google',
                  prefix: FontAwesomeIcons.googlePlusG,
                  radius: 30,
                  isUpperCase: false,
                  fontColor: AppColors.mainColor,
                  borderWidth: 1,
                  backgroundColor: Colors.white),
            ),
            const SizedBox(height: 20
            ),
          ],
        ),
      ),
    );
  }

  validate() async{
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (formKey.currentState!.validate()) {
      if(isVerify==true){
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool('isLogin', true);
        navigateAndFinsh(context, HomeScreen());
      }else{
        CustomSnackBar.snackBar(
            context: context,
            data: 'Please verify your number',
            color: AppColors.error);
      }
    }  else {

    }
  }
}
