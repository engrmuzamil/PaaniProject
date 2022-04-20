import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class OrderProvider with ChangeNotifier {
  Future<void> deleteCartData(String productId) async {
    await FirebaseFirestore.instance
        .collection('Cart')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('Product')
        .doc(productId)
        .delete();
    notifyListeners();
  }

  Future<void> addOrderData(String orderID, String paymentMethod,
      int totalAmount, String address, String mobileNo, String name) async {
    await FirebaseFirestore.instance
        .collection('Orders')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("OrderData")
        .doc(orderID)
        .set({
      'orderID': orderID,
      'paymentMethod': paymentMethod,
      'totalAmount': totalAmount,
      'address': address,
      'mobileNo': mobileNo,
      'name': name
    });
    notifyListeners();
  }

  transferData(String orderID) async {
    var db = await FirebaseFirestore.instance;
    var dbFrom = db
        .collection('Cart')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('Product');
    var dbTo = db
        .collection('Orders')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('OrderData')
        .doc(orderID)
        .collection("OrderDetails");
    var getFrom = dbFrom.get();
    getFrom.then((value) {
      value.docs.forEach((element) {
        dbTo.doc(element.id).set({
          'productId': element.get('productId'),
          'productName': element.get('productName'),
          'productImage': element.get('productImage'),
          'productQuantity': element.get('productQuantity'),
          'productPrice': element.get('productPrice'),
        });
        deleteCartData(element.get('productId'));
      });
    });
  }
}
