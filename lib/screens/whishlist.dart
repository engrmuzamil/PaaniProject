import 'package:flutter/material.dart';
import 'package:panni/providers/whishlist_provider.dart';
import 'package:panni/screens/Widgets/whishlistitem.dart';
import 'package:provider/provider.dart';

class Whishlist extends StatefulWidget {
  const Whishlist({Key? key}) : super(key: key);

  @override
  State<Whishlist> createState() => _WhishlistState();
}

class _WhishlistState extends State<Whishlist> {
  @override
  void initState() {
    WhishlistProvider whishlistProvider = Provider.of(context, listen: false);
    whishlistProvider.getWhishlistData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WhishlistProvider whishlistProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFFF0f5e9c),
          title: Text(
            "Whishlist",
            style: TextStyle(color: Colors.white),
          ),
          actionsIconTheme: IconThemeData(color: Colors.white, size: 30),
          actions: [
            Icon(Icons.menu, color: Color.fromARGB(255, 107, 100, 100)),
          ]),
      body: ListView(
        children: whishlistProvider.getwhishList.map((data) {
          return WhishlistItem(
            productImage: data.productImage,
            productName: data.productName,
            productPrice: data.productPrice,
            productId: data.productId,
          );
        }).toList(),
      ),
    );
  }
}
