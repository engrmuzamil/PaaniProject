import 'package:flutter/material.dart';
import 'package:panni/providers/cart_provider.dart';
import 'package:panni/providers/whishlist_provider.dart';
import 'package:panni/screens/cart.dart';
import 'package:panni/screens/whishlist.dart';
import 'package:provider/provider.dart';

class MyBottomAppBar extends StatelessWidget {
  final String productId, productName, productImage;
  final int productPrice, productQuantity;
  const MyBottomAppBar(
      {Key? key,
      required this.productId,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
    WhishlistProvider whishlistProvider = Provider.of(context);
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {
            cartProvider.addCartData(productId, productName, productImage,
                productQuantity, productPrice);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2, color: Color(0xFFF0f5e9c))),
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.shopping_cart, color: Color(0xFFF0f5e9c), size: 40),
                Text("Add To Cart",
                    style: TextStyle(color: Color(0xFFF0f5e9c), fontSize: 18)),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            whishlistProvider.addWhishlistData(
                productId, productName, productImage, productPrice);
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Whishlist()));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFF0f5e9c),
                border: Border.all(
                    width: 2, color: Color.fromARGB(106, 15, 95, 156))),
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height / 12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.favorite_border, color: Colors.white, size: 40),
                Text("Add To Whishlist",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
