import 'package:flutter/material.dart';
import 'package:panni/providers/product_provider.dart';
import 'package:panni/screens/cart.dart';
import 'package:panni/screens/search.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool isHome;
  const MyAppBar({Key? key, required this.title, required this.isHome})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFF0f5e9c),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      actionsIconTheme: IconThemeData(color: Colors.white, size: 30),
      actions: isHome
          ? [
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => SearchItem(
                  //               productProvider: Provider.of<ProductProvider>(
                  //                   context,
                  //                   listen: false),
                  //             )));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchItem(
                                productList:
                                    Provider.of<ProductProvider>(context)
                                        .getProductList,
                              )));
                },
                child: CircleAvatar(
                    child: Icon(Icons.search, color: Color(0xFFF0f5e9c)),
                    backgroundColor: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Cart()));
                  },
                  child: CircleAvatar(
                      child: Icon(Icons.shop, color: Color(0xFFF0f5e9c)),
                      backgroundColor: Colors.white),
                ),
              ),
            ]
          : [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
