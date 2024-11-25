import 'package:flutter/material.dart';

class ButtonSelectShopCategory extends StatefulWidget {
  const ButtonSelectShopCategory({Key? key,this.shop,this.title,this.mainIndex, this.selctedIndex,this.onTap}) : super(key: key);
  final mainIndex,selctedIndex;
  final onTap;
  final title;
  final shop;
  @override
  State<ButtonSelectShopCategory> createState() => _ButtonSelectShopCategoryState();
}

class _ButtonSelectShopCategoryState extends State<ButtonSelectShopCategory> {
  double? fontSize=12;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.shop['name'].length>12){
      fontSize=9;
    }
    else if(widget.shop['name'].length>14){
      fontSize=7;
    }
  }
  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    final width=MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
          left: 5.0, right: 0, bottom: 5, top: 5),
      child: SizedBox(
        height: height * .20,
        width: width * .30,
        child: Card(
          elevation: 10,
          color: widget.selctedIndex
              ? Colors.green
              : Colors.black38,
          shape: const RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(10)),
            side: BorderSide(color: Colors.white),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: height * .15,
                width: width * .30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/loading.gif',
                    image: widget.shop['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 3,right: 3),
                child: Text(
                  widget.shop['name'].toUpperCase(),
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
