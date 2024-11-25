import 'package:flutter/material.dart';
import 'package:ows_myshopline_retailer/core/widgets/custom_form_field.dart';
import 'package:flutter/cupertino.dart';

class CreateCategoryOffer extends StatefulWidget {
  const CreateCategoryOffer({Key? key}) : super(key: key);

  @override
  State<CreateCategoryOffer> createState() => _CreateCategoryOfferState();
}

class _CreateCategoryOfferState extends State<CreateCategoryOffer> {
  TextEditingController _controllerName = TextEditingController();
  bool _switchValue1 = true;
  bool _switchValue2 = false;
  bool _switchValue3 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Category Offer'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*.05,
            ),
            SizedBox(
              height: 45,
              child: CustomFormField(
                autoFocus: false,
                  maxLine: 1,
                  controlller: _controllerName,
                  errorMsg: 'Enter Category Name',
                  labelText: 'Category Name',
                  readOnly: false,
                  icon: Icons.home_work_outlined,
                  maxLimit: 60,
                  maxLimitError: '60',
                  textInputType: TextInputType.text),
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding:  EdgeInsets.only(left: 20.0, bottom: 0),
                child: Text('Change Category Images'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 28),
              child: GestureDetector(
                onTap: (){

                },
                child: Container(
                  width: double.infinity,
                  height: 80,
                  child: Center(child: Image.asset('assets/img_4.png'),),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 45,
              child: CustomFormField(
                  maxLine: 1,
                  autoFocus: false,
                  controlller: _controllerName,
                  errorMsg: 'Enter Offer Category',
                  labelText: 'Offer Category',
                  readOnly: false,
                  icon: Icons.home_work_outlined,
                  maxLimit: 60,
                  maxLimitError: '60',
                  textInputType: TextInputType.text),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width * .5,
                  child: CustomFormField(
                      maxLine: 1,
                      autoFocus: false,
                      controlller: _controllerName,
                      errorMsg: 'Enter Product MRP',
                      labelText: 'Product MRP',
                      readOnly: false,
                      icon: Icons.home_work_outlined,
                      maxLimit: 60,
                      maxLimitError: '60',
                      textInputType: TextInputType.text),
                ),
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width * .5,
                  child: CustomFormField(
                      maxLine: 1,
                      autoFocus: false,
                      controlller: _controllerName,
                      errorMsg: 'Enter Product Discount Price',
                      labelText: 'Product Discount Price',
                      readOnly: false,
                      icon: Icons.home_work_outlined,
                      maxLimit: 60,
                      maxLimitError: '60',
                      textInputType: TextInputType.text),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width * .5,
                  child: CustomFormField(
                      maxLine: 1,
                      autoFocus: false,
                      controlller: _controllerName,
                      errorMsg: 'Enter Start Date',
                      labelText: 'Start Date',
                      readOnly: false,
                      icon: Icons.home_work_outlined,
                      maxLimit: 60,
                      maxLimitError: '60',
                      textInputType: TextInputType.text),
                ),
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width * .5,
                  child: CustomFormField(
                      maxLine: 1,
                      autoFocus: false,
                      controlller: _controllerName,
                      errorMsg: 'Enter End Date',
                      labelText: 'End Date',
                      readOnly: false,
                      icon: Icons.home_work_outlined,
                      maxLimit: 60,
                      maxLimitError: '60',
                      textInputType: TextInputType.text),
                ),
              ],
            ),
            const SizedBox(
                height: 30
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text('Fixed Price ?'),
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
                    const Text('Credit card Offer ?'),
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
                    const Text('Display Price ?'),
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
            const SizedBox(height: 80,),
            SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width*.8,
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
                  onPressed: (){},
                  child: Text("Submit".toUpperCase(),
                      style: const TextStyle(fontSize: 18))),
            )
          ],
        ),
      ),
    );
  }
}
