import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:panni/models/delivery_class.dart';
import 'package:panni/screens/deliveryaddress.dart';

class CheckoutProvider with ChangeNotifier {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController alternateMobileNo = TextEditingController();
  TextEditingController society = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController pincode = TextEditingController();
  var setLocation;

  void validator(BuildContext context, var myType) async {
    String type = myType.toString();
    type = type.split('.').last;
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "First Name is Required Field");
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Last Name is Required Field");
    } else if (mobileNo.text.isEmpty) {
      Fluttertoast.showToast(msg: "Mobile Number is Required Field");
    } else if (street.text.isEmpty) {
      Fluttertoast.showToast(msg: "Street is Required Field");
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: "City is Required Field");
    } else if (area.text.isEmpty) {
      Fluttertoast.showToast(msg: "Area is Required Field");
    } else if (setLocation == null) {
      Fluttertoast.showToast(
          msg: "Location is Required. Click on Set Location Button");
      return;
    } else if (setLocation.latitude == null || setLocation.longitude == null) {
      Fluttertoast.showToast(
          msg: "Location is Required. Click on Set Location Button");
    } else {
      await FirebaseFirestore.instance
          .collection('DeliveryAddress')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("Addresses")
          .doc()
          .set({
        'firstName': firstName.text,
        'lastName': lastName.text,
        'mobileNo': mobileNo.text,
        'alternateMobileNo':
            alternateMobileNo.text.isEmpty ? "NULL" : alternateMobileNo.text,
        'society': society.text.isEmpty ? "NULL" : society.text,
        'street': street.text,
        'landmark': landmark.text.isEmpty ? "NULL" : landmark.text,
        'city': city.text,
        'area': area.text,
        'pincode': landmark.text.isEmpty ? "NULL" : pincode.text,
        'AddressType': type,
        'Longitude': setLocation.longitude,
        'Latitude': setLocation.latitude,
      }).then((value) => {
                Fluttertoast.showToast(
                  msg: "Delivery Address Added Successfully",
                ),
                Navigator.of(context).pop()
              });
      firstName.clear();
      lastName.clear();
      mobileNo.clear();
      alternateMobileNo.clear();
      society.clear();
      street.clear();
      landmark.clear();
      city.clear();
      area.clear();
      pincode.clear();
      setLocation = null;
      notifyListeners();
    }
  }

  List<DeliveryAddressModel> deliveryList = [];
  late DeliveryAddressModel delivery;
  void getAddressData() async {
    List<DeliveryAddressModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection('DeliveryAddress')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Addresses")
        .get();
    value.docs.forEach((data) {
      deliveryList.add(delivery = DeliveryAddressModel(
        firstName: data.get("firstName"),
        lastName: data.get("lastName"),
        mobileNo: data.get("mobileNo"),
        alternateMobileNo: data.get("alternateMobileNo"),
        society: data.get("society"),
        street: data.get("street"),
        landmark: data.get("landmark"),
        city: data.get("city"),
        area: data.get("area"),
        pincode: data.get("pincode"),
        addressType: data.get("AddressType"),
        latitude: data.get("Latitude"),
        longitude: data.get("Longitude"),
      ));
      newList.add(delivery);
    });
    deliveryList = newList;
    notifyListeners();
  }

  List<DeliveryAddressModel> get getDeliveryList {
    return deliveryList;
  }
}
