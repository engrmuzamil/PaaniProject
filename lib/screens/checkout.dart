import 'package:flutter/material.dart';
import 'package:panni/providers/checkout_provider.dart';
import 'package:panni/screens/Widgets/addressItem.dart';
import 'package:panni/screens/Widgets/appbar.dart';
import 'package:panni/screens/deliveryaddress.dart';
import 'package:panni/screens/payment.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  void initState() {
    CheckoutProvider checkoutProvider = Provider.of(context, listen: false);
    checkoutProvider.getAddressData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    String title = "", addressType = "", address = "", phoneNumber = "";
    print(checkoutProvider.getDeliveryList);
    return Scaffold(
        appBar: MyAppBar(title: "Checkout", isHome: false),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DeliveryAddress()));
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xFFF0f5e9c),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Deliver To",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFF0f5e9c))),
              leading: Icon(Icons.location_on, color: Color(0xFFF0f5e9c)),
            ),
            Divider(
              color: Color(0xFFF0f5e9c),
              thickness: 3,
            ),
            Column(
              children: checkoutProvider.getDeliveryList.map((data) {
                return AddressItem(
                  title: data.firstName + " " + data.lastName,
                  addressType: data.addressType,
                  address: data.street + " " + data.city + " " + data.area,
                  phoneNumber: data.mobileNo,
                  onTap: () {
                    title = data.firstName + " " + data.lastName;
                    addressType = data.addressType;
                    address = data.street + " " + data.city + " " + data.area;
                    phoneNumber = data.mobileNo;
                    print(title);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Payment(
                                  title: title,
                                  addressType: addressType,
                                  address: address,
                                  phoneNumber: phoneNumber,
                                )));
                  },
                );
              }).toList(),
            ),
          ],
        ));
  }
}
