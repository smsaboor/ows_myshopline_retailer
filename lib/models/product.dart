import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ows_myshopline_retailer/constants/firestore_constants.dart';

class ModelProduct {
  String productName;
  String productUrl;
  String productDescription;
  String productCategory;
  String productSubCategory;
  String productMrp;
  String productDiscount;
  String userId;

  ModelProduct({
    required this.productName,
    required this.productUrl,
    required this.productDescription,
    required this.productCategory,
    required this.productSubCategory,
    required this.productMrp,
    required this.productDiscount,
    required this.userId,

  });

  Map<String, String> toJson() {
    return {
      'productName': productName,
      'productUrl': productUrl,
      'productDescription': productDescription,
      'productCategory': productCategory,
      'productSubCategory': productSubCategory,
      'productMrp': productMrp,
      'productDiscount': productDiscount,
      'userId': userId,
    };
  }

  factory ModelProduct.fromDocument(DocumentSnapshot doc) {
    String productName = "";
    String productUrl = "";
    String productDescription = "";
    String productCategory = "";
    String productSubCategory = "";
    String productMrp = "";
    String productDiscount = "";
    String userId = "";
    try {
      productName = doc.get('productName');
    } catch (e) {}
    try {
      productUrl = doc.get('productUrl');
    } catch (e) {}
    try {
      productDescription = doc.get('productDescription');
    } catch (e) {}
    try {
      productCategory = doc.get('productCategory');
    } catch (e) {}
    try {
      productSubCategory = doc.get('productSubCategory');
    } catch (e) {}
    try {
      productMrp = doc.get('productMrp');
    } catch (e) {}
    try {
      productDiscount = doc.get('productDiscount');
    } catch (e) {}
    try {
      userId = doc.get('userId');
    } catch (e) {}
    return ModelProduct(
      productName: productName,
      productUrl: productUrl,
      productDescription: productDescription,
      productCategory: productCategory,
      productSubCategory: productSubCategory,
      productMrp: productMrp,
      productDiscount: productDiscount,
        userId:userId
    );
  }
}
