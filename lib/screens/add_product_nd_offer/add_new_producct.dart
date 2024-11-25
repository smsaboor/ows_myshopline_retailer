import 'package:flutter/material.dart';
import 'package:ows_myshopline_retailer/constants/colors.dart';
import 'package:ows_myshopline_retailer/core/widgets/custom_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:ows_myshopline_retailer/core/widgets/custom_snackbaar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:ows_myshopline_retailer/core/image_source.dart';
import 'package:ows_myshopline_retailer/providers/providers.dart';
import 'package:ows_myshopline_retailer/screens/login/login2.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ows_myshopline_retailer/providers/setting_provider.dart';
import 'package:ows_myshopline_retailer/providers/product_provider.dart';
import 'package:ows_myshopline_retailer/models/product.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({Key? key}) : super(key: key);

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  TextEditingController _controllerProductName = TextEditingController();
  TextEditingController _controllerProductDescription = TextEditingController();
  TextEditingController _controllerProductCategoryName =
      TextEditingController();
  TextEditingController _controllerProductSubCategory = TextEditingController();
  TextEditingController _controllerProductMrp = TextEditingController();
  TextEditingController _controllerProductDiscount = TextEditingController();

  bool _switchValue1 = true;
  bool _switchValue2 = false;
  bool _switchValue3 = true;
  double textBoxHeight = 55;
  bool isLoading = false;
  String id = '';
  String nickname = '';
  String aboutMe = '';
  String photoUrl = '';
  File? avatarImageFile;
  late SettingProvider settingProvider;
  late ProductProvider productProvider;
  var uuid = Uuid();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var imagePicker;
  File? _image;

  late AuthProvider authProvider;
  late String currentUserId;
  late String currentUserName;
  late String currentUserPhtoUrl;

  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
    authProvider = context.read<AuthProvider>();
    settingProvider = context.read<SettingProvider>();
    productProvider = context.read<ProductProvider>();
    // homeProvider = context.read<HomeProvider>();
    if (authProvider.getUserFirebaseId()?.isNotEmpty == true) {
      currentUserId = authProvider.getUserFirebaseId()!;
      currentUserName = authProvider.getUserFirebaseName()!;
      currentUserPhtoUrl = authProvider.getUserFirebasePhotoUrl()!;
      print('----------------------------${currentUserPhtoUrl}');
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
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
              SizedBox(
                height: textBoxHeight,
                child: CustomFormField(
                    maxLine: 1,
                    autoFocus: false,
                    controlller: _controllerProductName,
                    errorMsg: 'Enter Product Name',
                    labelText: 'Product Name',
                    readOnly: false,
                    icon: Icons.home_work_outlined,
                    maxLimit: 30,
                    maxLimitError: '30',
                    textInputType: TextInputType.text),
              ),
              const SizedBox(
                height: 15,
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0, bottom: 0),
                  child: Text('Upload Product Images'),
                ),
              ),
              avatarImageFile == null
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        showAlertDialog(context);
                      },
                      child: Image.file(
                        avatarImageFile!,
                        height: 80,
                        width: 200,
                      ),
                    ),
              avatarImageFile == null
                  ? Padding(
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
                    )
                  : Container(),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 90,
                child: CustomFormField(
                    maxLine: 3,
                    autoFocus: false,
                    controlller: _controllerProductDescription,
                    errorMsg: 'Enter Product Description',
                    labelText: 'Product Description',
                    readOnly: false,
                    icon: Icons.home_work_outlined,
                    maxLimit: 80,
                    maxLimitError: '80',
                    textInputType: TextInputType.text),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: textBoxHeight,
                child: CustomFormField(
                    maxLine: 1,
                    autoFocus: false,
                    controlller: _controllerProductCategoryName,
                    errorMsg: 'Enter Product Category',
                    labelText: 'Product Category',
                    readOnly: false,
                    icon: Icons.home_work_outlined,
                    maxLimit: 30,
                    maxLimitError: '30',
                    textInputType: TextInputType.text),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                height: textBoxHeight,
                child: CustomFormField(
                    maxLine: 1,
                    autoFocus: false,
                    controlller: _controllerProductSubCategory,
                    errorMsg: 'Enter Sub Category',
                    labelText: 'Product Sub Category',
                    readOnly: false,
                    icon: Icons.home_work_outlined,
                    maxLimit: 30,
                    maxLimitError: '30',
                    textInputType: TextInputType.text),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: textBoxHeight,
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
                    height: textBoxHeight,
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
                height: 40,
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
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                    side: BorderSide(color: Colors.red)))),
                    onPressed: () {
                      validate();
                    },
                    child: isLoading?Center(child: CircularProgressIndicator(),):Text("Submit".toUpperCase(),
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
      if (avatarImageFile == null) {
        CustomSnackBar.snackBar(
            context: context,
            data: 'please select image!',
            color: AppColors.error);
      } else {
        saveProduct();
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
    var source = type == ImageSourceType.camera
        ? ImageSource.camera
        : ImageSource.gallery;
    // XFile image = await imagePicker.pickImage(
    //     source: source,
    //     imageQuality: 50,
    //     preferredCameraDevice: CameraDevice.front);
    PickedFile? pickedFile =
        await imagePicker.getImage(source: source).catchError((err) {
      Fluttertoast.showToast(msg: err.toString());
    });
    File? image;
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
    if (image != null) {
      setState(() {
        avatarImageFile = image;
      });
    }
  }

  Future saveProduct() async {
    setState(() {
      isLoading = true;
    });
    var time = DateTime.now().millisecondsSinceEpoch.toString();
    UploadTask uploadTask =
        settingProvider.uploadFile(avatarImageFile!, 'products/$time.png');
    try {
      TaskSnapshot snapshot = await uploadTask;
      photoUrl = await snapshot.ref.getDownloadURL();
      ModelProduct updateInfo = ModelProduct(
          productName: _controllerProductName.text,
          productUrl: photoUrl,
          productDescription: _controllerProductDescription.text,
          productCategory: _controllerProductCategoryName.text,
          productSubCategory: _controllerProductSubCategory.text,
          productMrp: _controllerProductMrp.text,
          productDiscount: _controllerProductDiscount.text,
          userId:currentUserId,
      );

      productProvider.addProductFirestore(
              'products', currentUserId, uuid.v4(),updateInfo.toJson())
          .then((data) async {
        // await settingProvider.setPref(FirestoreConstants.photoUrl, photoUrl);
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: "Product successfully save");
        Navigator.pop(context);
      }).catchError((err) {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(msg: err.toString());
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: e.message ?? e.toString());
    }
  }
}
