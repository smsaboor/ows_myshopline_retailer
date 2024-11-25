import 'package:flutter/material.dart';


class HomeForgetPassword extends StatefulWidget {
  const HomeForgetPassword({Key? key}) : super(key: key);
  @override
  _HomeForgetPasswordState createState() => _HomeForgetPasswordState();
}

class _HomeForgetPasswordState extends State<HomeForgetPassword> {
  // getSP()async{
  //   await SharedPreferences.getInstance();
  // }
  late FocusNode text1, text2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    text1 = FocusNode();
    text2 = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    text1.dispose();
    text2.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  TextEditingController _controllerMobile = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  bool tryRegistration = false;
  bool isRegistered = false;
  int? status = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * .15,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  child: Center(child: Image.asset('assets/logo2.png'))),
              SizedBox(
                height: MediaQuery.of(context).size.height * .13,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, bottom: 15),
                child: Text(
                  "Enter Your Registered Mobile Number",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xE1100A44),
                      fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Theme(
                  data: ThemeData(
                    primaryColor: Colors.redAccent,
                    primaryColorDark: Colors.red,
                  ),
                  child: new TextFormField(
                    textInputAction: TextInputAction.next,
                    focusNode: text1,
                    controller: _controllerMobile,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Your Mobile';
                      }
                      else if (value!.length>10) {
                        return 'Character Limit 10';
                      }
                      return null;
                    },
                    onChanged: (v) {
                      setState(() {
                        tryRegistration = false;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)),
                        labelText: 'Mobile',
                        prefixText: ' ',
                        prefixIcon: Icon(
                          Icons.phone_android,
                          color: Colors.blue,
                        ),
                        suffixStyle: const TextStyle(color: Colors.green)),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                height: 60,
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {
                      _verifyUser(context);
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        textStyle: TextStyle(
                            fontSize: 36, fontWeight: FontWeight.bold)),
                    child: tryRegistration
                        ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                        : Text(
                      "Continue",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _verifyUser(BuildContext context) async {
    // Navigator.of(context).push(MaterialPageRoute(builder: (_) => DoctorDashBoard()));
  }

  bool _isEmailValidate(String txt) {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(txt);
  }
}
