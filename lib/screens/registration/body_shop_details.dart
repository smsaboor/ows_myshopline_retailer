import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ows_myshopline_retailer/constants/colors.dart';
import 'package:ows_myshopline_retailer/constants/components.dart';
import 'package:ows_myshopline_retailer/constants/products.dart';
import 'package:ows_myshopline_retailer/core/components.dart';
import 'package:ows_myshopline_retailer/core/widgets/custom_snackbaar.dart';
import 'package:ows_myshopline_retailer/providers/auth_provider.dart';
import 'package:ows_myshopline_retailer/screens/home_screen.dart';
import 'package:ows_myshopline_retailer/screens/registration/shop_location.dart';
import 'package:ows_myshopline_retailer/core/widgets/custom_form_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class BodyShopDetails extends StatefulWidget {
  const BodyShopDetails({Key? key}) : super(key: key);
  @override
  State<BodyShopDetails> createState() => _BodyShopDetailsState();
}

class _BodyShopDetailsState extends State<BodyShopDetails> {
  bool isHindi = true;
  int selectedIndex = 0;
  bool isVerify=false;

  TextEditingController _controllerShopName = TextEditingController();
  TextEditingController _controllerShopOwnerName = TextEditingController();
  TextEditingController _controllerShopLocation = TextEditingController();
  TextEditingController _controllerShopContact = TextEditingController();
  TextEditingController _controllerShopBankAccountNumber = TextEditingController();
  TextEditingController _controllerGstNumber = TextEditingController();
  TextEditingController _controllerAddress = TextEditingController();

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<FormState> formKey2 = new GlobalKey<FormState>();


  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  late FocusNode text1, text2, text3, text4;
  bool isVerifyOtp=false;
  bool nameFieldFocus=false;

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
    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .05,
          ),
          SizedBox(
            height: 55,
            child: CustomFormField(
                maxLine: 1,
                autoFocus: nameFieldFocus,
                controlller: _controllerShopName,
                errorMsg: 'Enter Shop Name',
                labelText: 'Shop Name',
                readOnly: false,
                icon: Icons.home_work_outlined,
                maxLimit: 60,
                maxLimitError: '60',
                textInputType: TextInputType.text),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 55,
            child: CustomFormField(
                maxLine: 1,
                autoFocus: false,
                controlller: _controllerShopOwnerName,
                errorMsg: 'Enter Owner Name',
                labelText: 'Owner Name',
                readOnly: false,
                icon: Icons.home,
                maxLimit: 30,
                maxLimitError: '30',
                textInputType: TextInputType.text),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 55,
            child: CustomFormField(
                maxLine: 1,
                autoFocus: false,
                controlller: _controllerShopLocation,
                errorMsg: 'Enter Location',
                labelText: 'Location',
                readOnly: false,
                icon: Icons.home,
                maxLimit: 100,
                maxLimitError: '100',
                textInputType: TextInputType.text),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                height: 55,
                width: MediaQuery.of(context).size.width*.75,
                child: CustomFormField(
                    maxLine: 1,
                    autoFocus: false,
                    controlller: _controllerShopContact,
                    errorMsg: 'Enter Mobile Number',
                    labelText: 'Mobile Number',
                    readOnly: false,
                    icon: Icons.home,
                    maxLimit: 10,
                    maxLimitError: '10',
                    textInputType: TextInputType.number),
              ),
              ElevatedButton(onPressed: (){
                alertDialog(context, products[0]);
              }, child: Text('Verify'))
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 55,
            child: CustomFormField(
                maxLine: 1,
                autoFocus: false,
                controlller: _controllerShopBankAccountNumber,
                errorMsg: 'Enter Bank Account No.',
                labelText: 'Bank Account',
                readOnly: false,
                icon: Icons.home,
                maxLimit: 20,
                maxLimitError: '20',
                textInputType: TextInputType.number),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 55,
            child: CustomFormField(
                maxLine: 1,
                autoFocus: false,
                controlller: _controllerGstNumber,
                errorMsg: 'Enter GST No',
                labelText: 'GST No (if any)',
                readOnly: false,
                icon: Icons.home,
                maxLimit: 15,
                maxLimitError: '15',
                textInputType: TextInputType.text),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * .06),
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
          SizedBox(height: MediaQuery.of(context).size.height * .06),
          SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            height: 55,
            child:  Padding(
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
          ),
          const SizedBox(height: 20
          ),
        ],
      ),
    );
  }

  validate() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (formKey.currentState!.validate()) {
      if(isVerify==true){
        navigateTo(context, ShopLocation());
      }else{
        CustomSnackBar.snackBar(
            context: context,
            data: 'Please verify your number',
            color: AppColors.error);
      }
    }  else {

    }
  }

  alertDialog(BuildContext context, var products) {
    if(mounted){
      setState(() {
        _controller1.clear();
        _controller2.clear();
        _controller3.clear();
        _controller4.clear();
      });
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 300,
            width: MediaQuery.of(context).size.width * .7,
            child: Column(
              children: [
                Row(
                  children: [
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.close))
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "Verify OTP",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xE1100A44),
                        fontSize: 30),
                    textAlign: TextAlign.left,
                  ),
                ),
                Divider(),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: Text(
                    "Enter 4 digit code send on \n${_controllerShopContact.text} ",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black45,
                        fontSize: 20),
                    textAlign: TextAlign.left,
                  ),
                ),
                _boxBuilder(context),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.defaultColor,
                          textStyle: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        _verifyOtp();
                      },
                      child: Text('Verify')),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _boxBuilder(BuildContext context) {
    return Form(
        key: formKey2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _box(context, _controller1, true, text1, text2),
            _box(context, _controller2, false, text2, text3),
            _box(context, _controller3, false, text3, text4),
            _box(context, _controller4, false, text4, text1),
          ],
        ));
  }

  Widget _box(BuildContext context, TextEditingController customController,
      bool focus, FocusNode text, FocusNode changeFocus) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 2.5),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 14,
      width: MediaQuery.of(context).size.width / 8,
      child: Center(
        child: TextField(
          autofocus: focus,
          focusNode: text,
          onChanged: (value) {
            if (value.length > 0) {
              FocusScope.of(context).requestFocus(changeFocus);
            }
          },
          cursorHeight: 40,
          controller: customController,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
              border: InputBorder.none,
              counterText: '',
              contentPadding: const EdgeInsets.all(20)),
        ),
      ),
      decoration:
      BoxDecoration(border: Border.all(color: Colors.blue, width: 1)),
    );
  }


  _verifyOtp() async {
    if (formKey2.currentState!.validate()) {
      String otp = _controller1.text +
          _controller2.text +
          _controller3.text +
          _controller4.text;
      if ('1234' == otp.toString()) {
        Navigator.of(context).pop();
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        AppCodes.showToast(msg: 'Otp Verified Successfully !');
          setState(() {
            isVerifyOtp=false;
            isVerify=true;
            _controller1.clear();
            _controller2.clear();
            _controller3.clear();
            _controller4.clear();
            nameFieldFocus=true;
            _controllerShopName.selection=TextSelection.fromPosition(TextPosition(offset: 3));
          });

      } else {
        if(mounted){
          setState(() {
            isVerifyOtp=false;
            isVerify=false;
            _controller1.clear();
            _controller2.clear();
            _controller3.clear();
            _controller4.clear();
          });
        }
        AppCodes.showToast(msg: 'Wrong otp!');
      }
    }
  }

}
