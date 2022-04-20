import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:panni/models/review_cart_model.dart';

class CartProvider with ChangeNotifier {
  Future<void> addCartData(String productId, String productName,
      String productImage, int productQuantity, int productPrice) async {
    await FirebaseFirestore.instance
        .collection('Cart')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('Product')
        .doc(productId)
        .set({
      'productId': productId,
      'productName': productName,
      'productImage': productImage,
      'productQuantity': productQuantity,
      'productPrice': productPrice
    });
    notifyListeners();
  }

  List<CartModel> cartList = [];
  late CartModel cartModel;
  void getCartData() async {
    List<CartModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection('Cart')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('Product')
        .get();
    value.docs.forEach((element) {
      cartList.add(cartModel = CartModel(
        productId: element.get('productId'),
        productName: element.get('productName'),
        productImage: element.get('productImage'),
        productQuantity: element.get('productQuantity'),
        productPrice: element.get('productPrice'),
      ));
      newList.add(cartModel);
    });
    cartList = newList;
    notifyListeners();
  }

  List<CartModel> get getCartList {
    return cartList;
  }

  Future<void> deleteCartData(String productId) async {
    await FirebaseFirestore.instance
        .collection('Cart')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('Product')
        .doc(productId)
        .delete();
    notifyListeners();
  }

  int getTotalPrice() {
    int sum = 0;
    cartList.forEach((element) {
      sum += element.productPrice * element.productQuantity;
    });
    return sum;
  }

    int getNetPrice() {
    int sum = 0;
    cartList.forEach((element) {
      sum += 50 * element.productQuantity;
    });
    return sum;
  }
}
