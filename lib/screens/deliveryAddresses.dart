import 'package:flutter/material.dart';
import 'package:panni/providers/checkout_provider.dart';
import 'package:panni/screens/Widgets/addressItem.dart';
import 'package:panni/screens/Widgets/appbar.dart';
import 'package:provider/provider.dart';

class DeliveryAddresses extends StatefulWidget {
  const DeliveryAddresses({Key? key}) : super(key: key);

  @override
  State<DeliveryAddresses> createState() => _DeliveryAddressesState();
}

class _DeliveryAddressesState extends State<DeliveryAddresses> {
  @override
  void initState() {
    // TODO: implement initState
    CheckoutProvider checkoutProvider = Provider.of(context, listen: false);
    checkoutProvider.getAddressData();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    print(checkoutProvider.getDeliveryList);
    return Scaffold(
        appBar: MyAppBar(title: "Delivery Addresses", isHome: false),
        body: ListView(
          children: <Widget>[
            Column(
              children: checkoutProvider.getDeliveryList.map((data) {
                return AddressItem(
                  title: data.firstName + " " + data.lastName,
                  addressType: data.addressType,
                  address: data.street + " " + data.city + " " + data.area,
                  phoneNumber: data.mobileNo,
                  onTap: () {},
                );
              }).toList(),
            ),
          ],
        ));
  }
}
