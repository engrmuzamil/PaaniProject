import 'package:flutter/material.dart';
import 'package:panni/providers/cart_provider.dart';
import 'package:panni/screens/cart.dart';
import 'package:provider/provider.dart';

class CounterWidget extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;
  
  const CounterWidget({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
  }) : super(key: key);

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int Count = 0;
  bool isAdd = false;
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of(context);

    return isAdd == true
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState(() {
                    if (Count == 1) {
                      isAdd = false;
                      Count = 0;
                      cartProvider.deleteCartData(widget.productId);
                    } else {
                      Count--;
                      cartProvider.addCartData(
                          widget.productId,
                          widget.productName,
                          widget.productImage,
                          Count,
                          widget.productPrice);
                    }
                    setState(() {});
                  });
                },
                child: Icon(
                  Icons.remove,
                  color: Color(0xFFF0f5e9c),
                  size: 30,
                ),
              ),
              Text(Count.toString(),
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFF0f5e9c),
                      fontWeight: FontWeight.bold)),
              InkWell(
                onTap: () {
                  setState(() {
                    Count++;
                  });
                  cartProvider.addCartData(widget.productId, widget.productName,
                      widget.productImage, Count, widget.productPrice);
                },
                child: Icon(
                  Icons.add,
                  color: Color(0xFFF0f5e9c),
                  size: 25,
                ),
              ),
            ],
          )
        : Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  Count++;
                  isAdd = true;
                });
                cartProvider.addCartData(widget.productId, widget.productName,
                    widget.productImage, Count, widget.productPrice);
              },
              child: Text("ADD",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFFF0f5e9c),
                      fontWeight: FontWeight.bold)),
            ),
          ]);
  }
}
