import 'package:flutter/material.dart';
import 'package:panni/providers/checkout_provider.dart';
import 'package:panni/providers/orderprovider.dart';
import 'package:panni/screens/Widgets/OrderItem.dart';
import 'package:panni/screens/Widgets/addressItem.dart';
import 'package:panni/screens/Widgets/appbar.dart';
import 'package:panni/screens/myOrderDetails.dart';
import 'package:provider/provider.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  void initState() {
    // TODO: implement initState
    OrderProvider orderProvider = Provider.of(context, listen: false);
    orderProvider.getOrderData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OrderProvider orderProvider = Provider.of(context);

    return Scaffold(
        appBar: MyAppBar(title: "My Orders", isHome: false),
        body: ListView(
          children: <Widget>[
            Column(
              children: orderProvider.getOrderList.map((data) {
                return OrderItem(
                  name: data.name,
                  paymentMethod: data.paymentMethod,
                  address: data.address,
                  mobileNumber: data.mobileNumber,
                  totalAmount: data.totalAmount,
                  orderID: data.orderID,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyOrdersDetail(orderID: data.orderID)));
                  },
                );
              }).toList(),
            ),
          ],
        ));
  }
}
