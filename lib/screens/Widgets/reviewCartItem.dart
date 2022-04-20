import 'package:flutter/material.dart';
import 'package:panni/providers/cart_provider.dart';
import 'package:panni/screens/cart.dart';
import 'package:provider/provider.dart';

class MyReviewCartProduct extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final int productQuantity;
  final String productId;
  final bool isCart;
  const MyReviewCartProduct(
      {Key? key,
      required this.productImage,
      required this.productName,
      required this.productPrice,
      required this.productQuantity,
      required this.productId,
      required this.isCart})
      : super(key: key);

  @override
  State<MyReviewCartProduct> createState() => _MyReviewCartProductState();
}

class _MyReviewCartProductState extends State<MyReviewCartProduct> {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);
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

                  cartProvider.deleteCartData(
                    widget.productId,
                  );
                  setState(() {});
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
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
          // onTap();
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
                    Text(widget.productQuantity.toString() + " Tanks",
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFFF0f5e9c))),
                  ],
                )),
            Expanded(
                flex: 1,
                child: widget.isCart
                    ? Column(
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
                          Row(
                            children: <Widget>[
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Color(0xFFF0f5e9c)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                        if (widget.productQuantity == 1) {
                                          cartProvider
                                              .deleteCartData(widget.productId);
                                        } else {
                                          cartProvider.addCartData(
                                              widget.productId,
                                              widget.productName,
                                              widget.productImage,
                                              widget.productQuantity - 1,
                                              widget.productPrice);
                                        }
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Cart()));
                                      },
                                      child: Icon(
                                        Icons.remove,
                                        color: Color(0xFFF0f5e9c),
                                        size: 20,
                                      ),
                                    ),
                                    Text(widget.productQuantity.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFFF0f5e9c))),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop();

                                        cartProvider.addCartData(
                                            widget.productId,
                                            widget.productName,
                                            widget.productImage,
                                            widget.productQuantity + 1,
                                            widget.productPrice);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Cart()));
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Color(0xFFF0f5e9c),
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Container(
                        child: Text(
                            "${widget.productQuantity * widget.productPrice}Rs.",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFFF0f5e9c))))),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
