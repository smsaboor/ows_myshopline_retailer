import 'package:flutter/material.dart';
import 'package:ows_myshopline_retailer/constants/colors.dart';
import 'package:ows_myshopline_retailer/core/widgets/custom_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:ows_myshopline_retailer/core/components.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:ows_myshopline_retailer/core/widgets/custom_snackbaar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:ows_myshopline_retailer/core/image_source.dart';

import 'package:flutter/material.dart';
import 'package:ows_myshopline_retailer/constants/colors.dart';
import 'package:ows_myshopline_retailer/core/widgets/custom_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:ows_myshopline_retailer/core/widgets/custom_snackbaar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:ows_myshopline_retailer/core/image_source.dart';


class CreateNewOffer extends StatefulWidget {
  const CreateNewOffer({Key? key}) : super(key: key);

  @override
  State<CreateNewOffer> createState() => _CreateNewOfferState();
}

class _CreateNewOfferState extends State<CreateNewOffer> {

  TextEditingController _controllerProductMrp = TextEditingController();
  TextEditingController _controllerProductDiscount = TextEditingController();
  TextEditingController _controllerStartDate = TextEditingController();
  TextEditingController _controllerEndDate= TextEditingController();

  bool _switchValue1 = true;
  bool _switchValue2 = false;
  bool _switchValue3 = true;

  String productName = 'Camera V30';
  List<String> productsNameList = ['Camera V30', 'A30', 'Bag 123'];

  String productCategory = 'Bags';
  List<String> productCategoryList = ['Bags', 'Mobile', 'Bag'];

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var imagePicker;
  File? _image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = new ImagePicker();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Special Offer'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              AppCodes.widgetSelectDialogBox(productName, productsNameList,
                  (user) {
                setState(() {
                  productName = user.toString();
                });
                print('------------------${user}');
                print('------------------${user}');
              }, MediaQuery.of(context).size.height * .5,
                  MediaQuery.of(context).size.width),
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, bottom: 0),
                  child: Text('Upload Product Images'),
                ),
              ),
              _image == null
                  ? Container()
                  : Image.file(_image!,
                height: 80,width: 200,
              ),
              _image == null?Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 28),
                child: GestureDetector(
                  onTap: () {
                    showAlertDialog(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    child: Center(
                      child: Image.asset('assets/img_4.png'),
                    ),
                  ),
                ),
              ):Container(),
              const SizedBox(
                height: 15,
              ),
              AppCodes.widgetSelectDialogBox(productCategory, productCategoryList,
                      (user) {
                    setState(() {
                      productCategory = user.toString();
                    });
                    print('------------------${user}');
                    print('------------------${user}');
                  }, MediaQuery.of(context).size.height * .5,
                  MediaQuery.of(context).size.width),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 55,
                    width: MediaQuery.of(context).size.width * .5,
                    child: CustomFormField(
                        maxLine: 1,
                        autoFocus: false,
                        controlller: _controllerProductMrp,
                        errorMsg: 'Enter Product MRP',
                        labelText: 'Product MRP',
                        readOnly: false,
                        icon: Icons.home_work_outlined,
                        maxLimit: 4,
                        maxLimitError: '4',
                        textInputType: TextInputType.number),
                  ),
                  SizedBox(
                    height: 55,
                    width: MediaQuery.of(context).size.width * .5,
                    child: CustomFormField(
                        maxLine: 1,
                        autoFocus: false,
                        controlller: _controllerProductDiscount,
                        errorMsg: 'Enter Product Discount Price',
                        labelText: 'Product Discount Price',
                        readOnly: false,
                        icon: Icons.home_work_outlined,
                        maxLimit: 4,
                        maxLimitError: '4',
                        textInputType: TextInputType.number),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.only(left: 5.0),
                    //decoration: myBoxDecoration(),
                    height: 80,
                    width: MediaQuery.of(context).size.width*.4,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: DateTimeField(
                            controller: _controllerStartDate,
                            //editable: false,
                            validator: (value) {
                              if (_controllerStartDate.text.length ==
                                  0) {
                                return 'Enter Booking Date';
                              }
                              return null;
                            },
                            decoration: new InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red, width: 1.0),
                              ),
                              enabledBorder:
                              const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black26,
                                    width: 1.0),
                              ),
                              border: const OutlineInputBorder(),
                              labelText: 'Booking Date',
                              labelStyle: const TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            format: DateFormat("yyyy-MM-dd"),
                            onShowPicker: (context, currentValue) {
                              return showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now().subtract(
                                    new Duration(days: 0)),
                                lastDate: DateTime.now()
                                    .add(new Duration(days: 240)),
                              );
                            },
                            onChanged: (dt) {
                              // _endDateController.text =
                              //     new DateFormat("yyyy-MM-dd").format(dt?.add(new Duration(days: 354)) ?? DateTime.now());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.only(left: 5.0),
                    //decoration: myBoxDecoration(),
                    height: 80,
                    width: MediaQuery.of(context).size.width*.4,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: DateTimeField(
                            controller: _controllerEndDate,
                            //editable: false,
                            validator: (value) {
                              if (_controllerEndDate.text.length ==
                                  0) {
                                return 'Enter Booking Date';
                              }
                              return null;
                            },
                            decoration: new InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.red, width: 1.0),
                              ),
                              enabledBorder:
                              const OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Colors.black26,
                                    width: 1.0),
                              ),
                              border: const OutlineInputBorder(),
                              labelText: 'Booking Date',
                              labelStyle: const TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            format: DateFormat("yyyy-MM-dd"),
                            onShowPicker: (context, currentValue) {
                              return showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now().subtract(
                                    new Duration(days: 0)),
                                lastDate: DateTime.now()
                                    .add(new Duration(days: 240)),
                              );
                            },
                            onChanged: (dt) {
                              // _endDateController.text =
                              //     new DateFormat("yyyy-MM-dd").format(dt?.add(new Duration(days: 354)) ?? DateTime.now());
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Fixed Price ?'),
                      CupertinoSwitch(
                        value: _switchValue1,
                        trackColor: Colors.red,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          setState(() {
                            _switchValue1 = !_switchValue1;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Crdit card Offer ?'),
                      CupertinoSwitch(
                        value: _switchValue2,
                        trackColor: Colors.red,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          setState(() {
                            _switchValue2 = !_switchValue2;
                          });
                        },
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Display Price ?'),
                      CupertinoSwitch(
                        value: _switchValue3,
                        trackColor: Colors.red,
                        activeColor: Colors.green,
                        onChanged: (value) {
                          setState(() {
                            _switchValue3 = !_switchValue3;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width * .8,
                child: ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                                side: BorderSide(color: Colors.red)))),
                    onPressed: () {
                      validate();
                    },
                    child: Text("Submit".toUpperCase(),
                        style: const TextStyle(fontSize: 18))),
              )
            ],
          ),
        ),
      ),
    );
  }


  validate() {
    bool isValidate = false;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (formKey.currentState!.validate()) {
      if(_image==null){
        CustomSnackBar.snackBar(
            context: context,
            data: 'please select image!',
            color: AppColors.error);
      }
      else{
        CustomSnackBar.snackBar(
            context: context,
            data: 'New Offer added successfully',
            color: Colors.green);
      }
    } else {}
  }


  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InkWell(
            onTap: () async {
              Navigator.pop(context);
              _handleURLButtonPress(context, ImageSourceType.gallery);
            },
            child: Container(
              child: ListTile(
                  title: Text("From Gallery"),
                  leading: Icon(
                    Icons.image,
                    color: Colors.deepPurple,
                  )),
            ),
          ),
          Container(
            width: 200,
            height: 1,
            color: Colors.black12,
          ),
          InkWell(
            onTap: () async {
              Navigator.pop(context);
              _handleURLButtonPress(context, ImageSourceType.camera);
            },
            child: Container(
              child: ListTile(
                  title: Text(
                    "From Camera",
                    style: TextStyle(color: Colors.red),
                  ),
                  leading: Icon(
                    Icons.camera,
                    color: Colors.red,
                  )),
            ),
          ),
        ],
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _handleURLButtonPress(BuildContext context, var type) async {

    print('md---- ');
    var source = type == ImageSourceType.camera
        ? ImageSource.camera
        : ImageSource.gallery;
    XFile image = await imagePicker.pickImage(
        source: source,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    print('md---- ');
    setState(() {
      _image = File(image.path);
      // uplaodImage = true;
      // uploadImage();
    });
    if (_image != null) {
      // Dio.FormData formData = new Dio.FormData.fromMap({
      //   "doctor_id": widget.id,
      //   "image": await Dio.MultipartFile.fromFile(_image!.path,
      //       filename: _image!.path.split('/').last)
      // });
      // bool result = await ProfileServices.create(formData);
      // if (result == true) {
      //   setState(() {
      //     _getImgeUrl(widget.id);
      //   });
      // }
    } else {}

    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => ImageFromGalleryEx(type)));
  }

}
