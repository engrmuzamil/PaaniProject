import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:panni/models/review_cart_model.dart';
import 'package:panni/models/whishlist_model.dart';

class WhishlistProvider with ChangeNotifier {
  Future<void> addWhishlistData(String productId, String productName,
      String productImage, int productPrice) async {
    await FirebaseFirestore.instance
        .collection('Whishlist')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('Products')
        .doc(productId)
        .set({
      'productId': productId,
      'productName': productName,
      'productImage': productImage,
      'productPrice': productPrice
    });
    notifyListeners();
  }

  List<WhishlistModel> whishList = [];
  late WhishlistModel whishListModel;

  
  void getWhishlistData() async {
    List<WhishlistModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection('Whishlist')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('Products')
        .get();
    value.docs.forEach((element) {
      whishList.add(whishListModel = WhishlistModel(
        productId: element.get('productId'),
        productName: element.get('productName'),
        productImage: element.get('productImage'),
        productPrice: element.get('productPrice'),
      ));
      newList.add(whishListModel);
    });
    whishList = newList;
    notifyListeners();
  }

  List<WhishlistModel> get getwhishList {
    return whishList;
  }

  Future<void> deleteWhishlistData(String productId) async {
    await FirebaseFirestore.instance
        .collection('Whishlist')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('Products')
        .doc(productId)
        .delete();
    notifyListeners();
  }
}
