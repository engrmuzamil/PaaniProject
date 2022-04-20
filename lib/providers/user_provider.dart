import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:panni/models/usermodel.dart';

class UserProvider with ChangeNotifier {
  Future<void> addUser(
      User user, String? userName, String? userEmail, String? userImage) async {
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
      'username': userName,
      'userEmail': userEmail,
      'userImage': userImage,
      'userId': user.uid,
    });
    notifyListeners();
  }

  late UserModel currUser =
      UserModel(userEmail: "", userImage: "", userName: "", userUid: "");

  void getUserData() async {
    UserModel simpleModel;
    var val = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    if (val.exists) {
      simpleModel = UserModel(
          userEmail: val.get("userEmail"),
          userImage: val.get("userImage"),
          userName: val.get("username"),
          userUid: val.get("userId"));
      currUser = simpleModel;
      notifyListeners();
    }
  }

  UserModel get userModelData {
    return currUser;
  }
}
