import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:panni/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> productList = [];
  late ProductModel productModel;

  fetchProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("Product").get();

    value.docs.forEach((element) {
      productList.add(productModel = ProductModel(
        productName: element.get("productName"),
        productPrice: element.get("productPrice"),
        productImage: element.get("productImage"),
        productId: element.get("productId"),
      ));
      newList.add(productModel);
    });

    productList = newList;
    notifyListeners();
  }

  List<ProductModel> get getProductList {
    return productList;
  }
}
