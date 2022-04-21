import 'package:flutter/material.dart';
import 'package:panni/providers/checkout_provider.dart';
import 'package:panni/providers/orderprovider.dart';
import 'package:panni/screens/Widgets/OrderItem.dart';
import 'package:panni/screens/Widgets/addressItem.dart';
import 'package:panni/screens/Widgets/appbar.dart';
import 'package:panni/screens/Widgets/reviewCartItem.dart';
import 'package:provider/provider.dart';

class MyOrdersDetail extends StatefulWidget {
  final String orderID;
  const MyOrdersDetail({Key? key, required this.orderID}) : super(key: key);

  @override
  State<MyOrdersDetail> createState() => _MyOrdersDetailState();
}

class _MyOrdersDetailState extends State<MyOrdersDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    OrderProvider orderProvider = Provider.of(context, listen: false);
    orderProvider.getOrderDetailData(widget.orderID);
  }

  @override
  Widget build(BuildContext context) {
    OrderProvider orderProvider = Provider.of(context);

    return Scaffold(
        appBar: MyAppBar(title: "Order Detail", isHome: false),
        body: ListView(
          children: <Widget>[
            Column(
              children: orderProvider.getOrderDetailList.map((data) {
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
          ],
        ));
  }
}
