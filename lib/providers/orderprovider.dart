import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:panni/models/ordermodel.dart';

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

  List<OrderModel> orders = [];
  late OrderModel order;
  Future<void> getOrderData() async {
    List<OrderModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("Orders")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("OrderData")
        .get();
    value.docs.forEach((element) {
      orders.add(order = OrderModel(
        orderID: element.get('orderID'),
        paymentMethod: element.get('paymentMethod'),
        totalAmount: element.get('totalAmount'),
        address: element.get('address'),
        mobileNumber: element.get('mobileNo'),
        name: element.get('name'),
      ));
      newList.add(order);
    });
    orders = newList;
    notifyListeners();
  }

  List<OrderModel> get getOrderList {
    return orders;
  }

  List<OrderDetailModel> orderdetails = [];
  late OrderDetailModel orderDetail;

  Future<void> getOrderDetailData(String invoiceID) async {
    List<OrderDetailModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("Orders")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("OrderData")
        .doc(invoiceID)
        .collection("OrderDetails")
        .get();
    value.docs.forEach((element) {
      orderdetails.add(orderDetail = OrderDetailModel(
        productId: element.get("productId"),
        productImage: element.get("productImage"),
        productName: element.get("productName"),
        productPrice: element.get("productPrice"),
        productQuantity: element.get("productQuantity"),
      ));
      newList.add(orderDetail);
    });
    orderdetails = newList;
    notifyListeners();
  }

  List<OrderDetailModel> get getOrderDetailList {
    return orderdetails;
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
