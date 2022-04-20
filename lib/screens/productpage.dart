import 'package:flutter/material.dart';
import 'package:panni/screens/Widgets/appbar.dart';
import 'package:panni/screens/Widgets/bottomAppBar1.dart';
import 'package:panni/screens/Widgets/drawer.dart';

class ProductDetail extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final int productQuantity;
  final String productId;
  const ProductDetail({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
    required this.productQuantity,
  }) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

enum fillEnum {
  empty,
  half,
  full,
}

class _ProductDetailState extends State<ProductDetail> {
  bool _value = false;
  Object? val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          title: "Product Detail",
          isHome: false,
        ),
        drawer: MyDrawer(),
        bottomNavigationBar: MyBottomAppBar(productId: widget.productId, productImage: widget.productImage, productName: widget.productName, productPrice: widget.productPrice, productQuantity: widget.productQuantity),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.productName,
                style: TextStyle(
                    color: Color(0xFFF0f5e9c),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                widget.productPrice.toString() + "Rs./Tank",
                style: TextStyle(
                    color: Color(0xFFF0f5e9c),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                  child: Image.network(
                    widget.productImage,
                    height: MediaQuery.of(context).size.height / 4,
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      "5 Litter",
                      style: TextStyle(color: Color(0xFFF0f5e9c), fontSize: 16),
                    ),
                    leading: Radio(
                      value: 1,
                      groupValue: val,
                      onChanged: (value) {
                        print(val);
                        print("value: " + value.toString());
                        setState(() {
                          val = value;
                        });
                      },
                      activeColor: Color(0xFFF0f5e9c),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "10 Litter",
                      style: TextStyle(color: Color(0xFFF0f5e9c), fontSize: 16),
                    ),
                    leading: Radio(
                      value: 2,
                      groupValue: val,
                      onChanged: (value) {
                        setState(() {
                          print(val);
                          print("value: " + value.toString());
                          val = value;
                        });
                      },
                      activeColor: Color(0xFFF0f5e9c),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "15 Litter",
                      style: TextStyle(color: Color(0xFFF0f5e9c), fontSize: 16),
                    ),
                    leading: Radio(
                      value: 3,
                      groupValue: val,
                      onChanged: (value) {
                        setState(() {
                          Object? values = value;
                          print(val);
                          print("value: " + value.toString());
                          val = value;
                        });
                      },
                      activeColor: Color(0xFFF0f5e9c),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
