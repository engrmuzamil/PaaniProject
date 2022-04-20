import 'package:flutter/material.dart';
import 'package:panni/providers/product_provider.dart';
import 'package:panni/screens/Widgets/appbar.dart';
import 'package:panni/screens/Widgets/drawer.dart';
import 'package:panni/screens/Widgets/product.dart';
import 'package:panni/screens/productpage.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatefulWidget {
  final ProductProvider productProvider;
  const AllProducts({Key? key, required this.productProvider})
      : super(key: key);

  @override
  State<AllProducts> createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "All Products", isHome: true),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: widget.productProvider.getProductList.map((data) {
            return MyProduct(
              productImage: data.productImage,
              productName: data.productName,
              productPrice: data.productPrice,
              productId: data.productId,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetail(
                              productImage: data.productImage,
                              productName: data.productName,
                              productPrice: data.productPrice,
                              productQuantity: 1,
                              productId: data.productId,
                            )));
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
