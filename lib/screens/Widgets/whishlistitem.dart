import 'package:flutter/material.dart';
import 'package:panni/providers/cart_provider.dart';
import 'package:panni/providers/whishlist_provider.dart';
import 'package:panni/screens/cart.dart';
import 'package:panni/screens/productpage.dart';
import 'package:panni/screens/whishlist.dart';
import 'package:provider/provider.dart';

class WhishlistItem extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;
  const WhishlistItem(
      {Key? key,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productId})
      : super(key: key);

  @override
  State<WhishlistItem> createState() => _WhishlistItemState();
}

class _WhishlistItemState extends State<WhishlistItem> {
  @override
  Widget build(BuildContext context) {
    WhishlistProvider whishlistProvider = Provider.of(context);
    int value = 0;

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Did You Really Want to Delete Item?'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text("Selected Item will be deleted from cart"),
                  Text('Would you like to Continue?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                  value = 0;
                },
              ),
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();

                  whishlistProvider.deleteWhishlistData(
                    widget.productId,
                  );
                  setState(() {});
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Whishlist()));
                  value = 1;
                },
              ),
            ],
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetail(
                        productImage: widget.productImage,
                        productName: widget.productName,
                        productPrice: widget.productPrice,
                        productQuantity: 1,
                        productId: widget.productId,
                      )));
        },
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  widget.productImage,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.productName,
                        style: TextStyle(
                          color: Color(0xFFF0f5e9c),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(widget.productPrice.toString() + "Rs./Tank",
                        style: TextStyle(
                          color: Color.fromARGB(255, 106, 135, 160),
                          fontSize: 14,
                        )),
                    SizedBox(height: 20),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _showMyDialog();
                        if (value == 1) {}
                      },
                      child: Icon(
                        Icons.delete,
                        color: Color(0xFFF0f5e9c),
                        size: 30,
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
