import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ows_myshopline_retailer/constants/colors.dart';
import 'package:ows_myshopline_retailer/constants/components.dart';
import 'package:ows_myshopline_retailer/core/widgets/custom_snackbaar.dart';
import 'widgets/button_next.dart';
import 'package:ows_myshopline_retailer/core/widgets/custom_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:time_range_picker/time_range_picker.dart';
import 'package:flutter/cupertino.dart';
import 'select_product_price.dart';
import 'widgets/button_location.dart';

class BodyShopLocation extends StatefulWidget {
  const BodyShopLocation({Key? key}) : super(key: key);

  @override
  State<BodyShopLocation> createState() => _BodyShopLocationState();
}

class _BodyShopLocationState extends State<BodyShopLocation> {
  bool isHindi = true;
  int selectedIndex = 1;
  bool boolPhoneCalls = false;
  bool boolEmail = false;
  bool boolWhatsApp = false;
  bool boolAppMessages = false;
  bool booReceivecalls = false;

  bool isCheckBox = false;
  TextEditingController _controllerAddress = TextEditingController();
  bool valueCheck = true;
  TimeRange? timimg;

  var dayInitial = "Monday";
  var dayList = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];
  var hoursOpening = "10:00 A.M";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery
        .of(context)
        .size
        .height;
    final sizeWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 24.0, right: 24, bottom: 10, top: 15),
            child: Row(
              children: const [
                Text(
                  "Shop Address ",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                Spacer(),
                Text(
                  "Verify",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(
            child: CustomFormField(
                maxLine: 2,
                autoFocus: false,
                controlller: _controllerAddress,
                errorMsg: 'Shop Address',
                labelText: '',
                readOnly: false,
                icon: Icons.shop,
                maxLimit: 120,
                maxLimitError: '120',
                textInputType: TextInputType.text),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 24.0, right: 20, bottom: 5),
            child: Row(
              children: const [
                Text(
                  "Working Hours",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0, right: 18),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * .4,
                  child: DropdownButton(
                    // Initial Value
                      menuMaxHeight: MediaQuery
                          .of(context)
                          .size
                          .height,
                      value: dayInitial,
                      dropdownColor: Colors.white,
                      focusColor: Colors.blue,
                      isExpanded: true,
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),
                      // Array list of items
                      items: dayList.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (user) {
                        setState(() {
                          dayInitial = user!;
                        });
                        print('------------------${user}');
                        print('------------------${user}');
                      }),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    TimeRange? result = await showTimeRangePicker(
                        context: context,
                        start: const TimeOfDay(hour: 9, minute: 0),
                        end: const TimeOfDay(hour: 12, minute: 0),
                        disabledTime: TimeRange(
                            startTime: const TimeOfDay(hour: 22, minute: 0),
                            endTime: const TimeOfDay(hour: 5, minute: 0)),
                        disabledColor: Colors.red.withOpacity(0.5),
                        strokeWidth: 4,
                        ticks: 24,
                        ticksOffset: -7,
                        ticksLength: 15,
                        ticksColor: Colors.grey,
                        labels: [
                          "12 am",
                          "3 am",
                          "6 am",
                          "9 am",
                          "12 pm",
                          "3 pm",
                          "6 pm",
                          "9 pm"
                        ]
                            .asMap()
                            .entries
                            .map((e) {
                          return ClockLabel.fromIndex(
                              idx: e.key, length: 8, text: e.value);
                        }).toList(),
                        labelOffset: 35,
                        rotateLabels: false,
                        padding: 60);
                    if (kDebugMode) {
                      setState(() {
                        timimg = result;
                      });
                      print("result $result");
                    }
                  },
                  child: const Text("Set Timing"),
                ),
              ],
            ),
          ),
          timimg == null
              ? Container()
              : Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: AppColors.greyColor,
              child: Text(
                  '  ${dayInitial}     ${timimg!.startTime.hour}:${timimg!
                      .startTime.minute}(Open) -  ${timimg!.endTime
                      .hour}:${timimg!.endTime
                      .minute}(Close)         Total: ${getTimeHours(
                      ((timimg!.endTime.hour - timimg!.startTime.hour) *
                          60) + (timimg!.startTime.minute +
                          timimg!.endTime.minute))} Hours'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 28.0),
            child: Row(
              children: const [
                Text(
                  "Receive Enquiries Via ",
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonLocationReceiveEnquiry(
                fontSize: 14,
                text: 'Phone Call',
                boolValue: boolPhoneCalls,
                onTab: () {
                  if (mounted) {
                    setState(() {
                      boolPhoneCalls = !boolPhoneCalls;
                    });
                  }
                },
              ),
              ButtonLocationReceiveEnquiry(
                text: 'Email',
                fontSize: 14,
                boolValue: boolEmail,
                onTab: () {
                  if (mounted) {
                    setState(() {
                      boolEmail = !boolEmail;
                    });
                  }
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ButtonLocationReceiveEnquiry(
                text: 'Whats App',
                fontSize: 14,
                boolValue: boolWhatsApp,
                onTab: () {
                  if (mounted) {
                    setState(() {
                      boolWhatsApp = !boolWhatsApp;
                    });
                  }
                },
              ),
              ButtonLocationReceiveEnquiry(
                text: 'App Messages',
                fontSize: 12,
                boolValue: boolAppMessages,
                onTab: () {
                  if (mounted) {
                    setState(() {
                      boolAppMessages = !boolAppMessages;
                    });
                  }
                },
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .02,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, bottom: 8),
            child: Row(
              children: [
                Checkbox(
                  value: booReceivecalls ? true : false,
                  checkColor: Colors.white,
                  activeColor: Colors.green,
                  onChanged: (bool? value) {
                    if (mounted) {
                      setState(() {
                        booReceivecalls = !booReceivecalls;
                      });
                    }
                  },
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Text(
                    "Receive Calls Only in Working Hours",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .03,
          ),
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width * .8,
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
        ],
      ),
    );
  }

  validate() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    bool isValidate = false;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (formKey.currentState!.validate()) {
      if (boolAppMessages == true || boolPhoneCalls == true ||
          boolWhatsApp == true || boolEmail == true) {
        isValidate=true;
      }
      if (isValidate) {
        navigateTo(context, SelectProductPrice());
      } else {
        CustomSnackBar.snackBar(
            context: context,
            data: 'Please 1 or more select enquiry type',
            color: AppColors.error);
      }
    } else {
    }
  }

  String getTimeHours(int value) {
    final int hour = value ~/ 60;
    final int minutes = value % 60;
    return '${hour.toString().padLeft(2, "0")}:${minutes.toString().padLeft(
        2, "0")}';
  }
}
