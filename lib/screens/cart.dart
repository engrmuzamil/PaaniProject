import 'package:flutter/material.dart';
import 'package:panni/providers/cart_provider.dart';
import 'package:panni/screens/Widgets/bottomAppBar1.dart';
import 'package:panni/screens/Widgets/reviewCartItem.dart';
import 'package:panni/screens/Widgets/searchproduct.dart';
import 'package:panni/screens/checkout.dart';
import 'package:panni/screens/home.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    CartProvider productProvider = Provider.of(context, listen: false);
    productProvider.getCartData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    int tPrice = cartProvider.getTotalPrice();
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFFF0f5e9c),
            title: Text(
              "Review Cart",
              style: TextStyle(color: Colors.white),
            ),
            actionsIconTheme: IconThemeData(color: Colors.white, size: 30),
            actions: [
              Icon(Icons.menu, color: Colors.white),
            ]),
        body: ListView(
          children: cartProvider.getCartList.map((data) {
            return MyReviewCartProduct(
              productImage: data.productImage,
              productName: data.productName,
              productPrice: data.productPrice,
              productQuantity: data.productQuantity,
              productId: data.productId,
              isCart: true,
            );
          }).toList(),
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
                        Text("${tPrice}Rs.",
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
              tPrice > 0
                  ? InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Checkout()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 12,
                        decoration: BoxDecoration(
                            color: Color(0xFFF0f5e9c),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 2,
                                color: Color.fromARGB(106, 15, 95, 156))),
                        child: Center(
                          child: Text("Proceed",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      ))
                  : InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 12,
                        decoration: BoxDecoration(
                            color: Color(0xFFF0f5e9c),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 2,
                                color: Color.fromARGB(106, 15, 95, 156))),
                        child: Center(
                          child: Text("Home",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16)),
                        ),
                      )),
            ],
          ),
        ));
  }
}
