import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:panni/providers/cart_provider.dart';
import 'package:panni/providers/orderprovider.dart';
import 'package:panni/screens/GoogleMap.dart';
import 'package:panni/screens/MyGooglePay.dart';
import 'package:panni/screens/Widgets/addressItem.dart';
import 'package:panni/screens/Widgets/appbar.dart';
import 'package:panni/screens/Widgets/reviewCartItem.dart';
import 'package:panni/screens/home.dart';
import 'package:provider/provider.dart';

import 'package:crypto/crypto.dart';

class Payment extends StatefulWidget {
  final String title, addressType, address, phoneNumber;
  const Payment({
    Key? key,
    required this.title,
    required this.addressType,
    required this.address,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

enum PaymentMethod {
  COD,
  GooglePay,
}

class _PaymentState extends State<Payment> {
  Object? _paymentMethod = PaymentMethod.COD;

  @override
  void initState() {
    // TODO: implement initState
    CartProvider cartProvider = Provider.of(context, listen: false);
    cartProvider.getCartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    OrderProvider orderprovider = Provider.of(context);
    int tPrice = cartProvider.getTotalPrice();
    int shippingCharges = cartProvider.getNetPrice();
    return Scaffold(
        appBar: MyAppBar(title: "Payment", isHome: false),
        body: ListView(
          children: <Widget>[
            AddressItem(
              title: widget.title,
              addressType: widget.addressType,
              address: widget.address,
              phoneNumber: widget.phoneNumber,
              onTap: () {},
              isCheckout: false,
            ),
            Column(
              children: cartProvider.getCartList.map((data) {
                return MyReviewCartProduct(
                  productImage: data.productImage,
                  productName: data.productName,
                  productPrice: data.productPrice,
                  productQuantity: data.productQuantity,
                  productId: data.productId,
                  isCart: false,
                );
              }).toList(),
            ),
            Divider(
              color: Color(0xFFF0f5e9c),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Total",
                      style: TextStyle(
                          color: Color(0xFFF0f5e9c),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  Text(
                    "${tPrice}Rs.",
                    style: TextStyle(
                        color: Color(0xFFF0f5e9c),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "Shipping Charges",
                      style: TextStyle(
                          color: Color.fromARGB(62, 15, 95, 156),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  Text(
                    "${shippingCharges}Rs.",
                    style: TextStyle(
                        color: Color.fromARGB(62, 15, 95, 156),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            Divider(
              color: Color(0xFFF0f5e9c),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "Payment Options",
                style: TextStyle(
                    color: Color(0xFFF0f5e9c),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            RadioListTile(
              activeColor: Color(0xFFF0f5e9c),
              value: PaymentMethod.COD,
              groupValue: _paymentMethod,
              onChanged: (value) {
                setState(() {
                  _paymentMethod = value;
                });
              },
              title: Text(
                "COD",
                style: TextStyle(
                    color: Color(0xFFF0f5e9c),
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              secondary: Icon(Icons.money, color: Color(0xFFF0f5e9c)),
            ),
            RadioListTile(
              activeColor: Color(0xFFF0f5e9c),
              value: PaymentMethod.GooglePay,
              groupValue: _paymentMethod,
              onChanged: (value) {
                setState(() {
                  _paymentMethod = value;
                });
              },
              title: Text(
                "GooglePay",
                style: TextStyle(
                    color: Color(0xFFF0f5e9c),
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              secondary:
                  Icon(Icons.payment_outlined, color: Color(0xFFF0f5e9c)),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 2, color: Colors.white)),
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 12,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Total Amount",
                            style: TextStyle(
                                color: Color(0xFFF0f5e9c), fontSize: 16)),
                        Text("${tPrice + shippingCharges}Rs.",
                            style: TextStyle(
                                color: Color(0xFFF0f5e9c),
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              InkWell(
                  onTap: () {
                    if (_paymentMethod == PaymentMethod.GooglePay) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyGooglePay(
                                    totalPrice: tPrice + shippingCharges,
                                  )));
                    } else {
                      final _random = Random();
                      const _availableChars =
                          'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
                      final randomString = List.generate(
                          16,
                          (index) => _availableChars[
                              _random.nextInt(_availableChars.length)]).join();

                      var bytes1 = utf8.encode(
                          "$widget.address $widget.title $widget.amount"); // data being hashed
                      var digest1 = sha256.convert(bytes1); // Hashing Process
                      print("Digest as bytes: ${digest1.bytes}"); // Print Bytes
                      print("Digest as hex string: $randomString");
                      orderprovider.addOrderData(
                        randomString.toString(),
                        "COD",
                        tPrice + shippingCharges,
                        widget.address,
                        widget.phoneNumber,
                        widget.title,
                      ); // Print After Hashing
                      orderprovider.transferData(
                        randomString.toString(),
                      );
                      Fluttertoast.showToast(msg: "Order is Made Successfully");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height / 12,
                    decoration: BoxDecoration(
                        color: Color(0xFFF0f5e9c),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            width: 2, color: Color.fromARGB(106, 15, 95, 156))),
                    child: Center(
                      child: Text("Procede Payment",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  )),
            ],
          ),
        ));
  }
}
