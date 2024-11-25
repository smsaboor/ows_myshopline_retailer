import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:ows_myshopline_retailer/screens/registration/body_product_price.dart';


class UpdateShopSetting extends StatefulWidget {
  const UpdateShopSetting({Key? key}) : super(key: key);

  @override
  State<UpdateShopSetting> createState() => _UpdateShopSettingState();
}

class _UpdateShopSettingState extends State<UpdateShopSetting> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Store Options'),centerTitle: true,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BodyProductPrice(gape: .05,nav:2),
          ],
        ),
      ),
    );
  }
}
