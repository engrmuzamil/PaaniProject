import 'package:flutter/material.dart';
import 'package:panni/providers/checkout_provider.dart';
import 'package:panni/screens/GoogleMap.dart';
import 'package:panni/screens/Widgets/Textfield.dart';
import 'package:panni/screens/Widgets/appbar.dart';
import 'package:provider/provider.dart';

class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({Key? key}) : super(key: key);

  @override
  State<DeliveryAddress> createState() => _DeliveryAddressState();
}

enum AddressType {
  Home,
  Office,
  Others,
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  Object? myType = AddressType.Home;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
        appBar: MyAppBar(title: "My Delivery Address", isHome: false),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
          child: InkWell(
            onTap: () async {
              checkoutProvider.validator(context, myType);
            },
            child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 12,
                decoration: BoxDecoration(
                  color: Color(0xFFF0f5e9c),
                  border: Border.all(color: Colors.black, width: 1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    " Add  Address ",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                )),
          ),
        ),
        body: ListView(children: <Widget>[
          MyTextField(
            autoFocus: true,
            controller: checkoutProvider.firstName,
            keyboardType: TextInputType.text,
            lblText: 'First Name*',
            maxLength: 10,
            obscureText: false,
            textInputAction: TextInputAction.next,
          ),
          MyTextField(
            autoFocus: true,
            controller: checkoutProvider.lastName,
            keyboardType: TextInputType.text,
            lblText: 'Last Name*',
            maxLength: 10,
            obscureText: false,
            textInputAction: TextInputAction.next,
          ),
          MyTextField(
            autoFocus: true,
            controller: checkoutProvider.mobileNo,
            keyboardType: TextInputType.number,
            lblText: 'Phone Number*',
            maxLength: 10,
            obscureText: false,
            textInputAction: TextInputAction.next,
          ),
          MyTextField(
            autoFocus: true,
            controller: checkoutProvider.alternateMobileNo,
            keyboardType: TextInputType.number,
            lblText: 'Alternate Mobile Number',
            maxLength: 10,
            obscureText: false,
            textInputAction: TextInputAction.next,
          ),
          MyTextField(
            autoFocus: true,
            controller: checkoutProvider.society,
            keyboardType: TextInputType.text,
            lblText: 'Society',
            maxLength: 50,
            obscureText: false,
            textInputAction: TextInputAction.next,
          ),
          MyTextField(
            autoFocus: true,
            controller: checkoutProvider.street,
            keyboardType: TextInputType.text,
            lblText: 'Street*',
            maxLength: 100,
            obscureText: false,
            textInputAction: TextInputAction.next,
          ),
          MyTextField(
            autoFocus: true,
            controller: checkoutProvider.landmark,
            keyboardType: TextInputType.text,
            lblText: 'Landmark',
            maxLength: 50,
            obscureText: false,
            textInputAction: TextInputAction.next,
          ),
          MyTextField(
            autoFocus: true,
            controller: checkoutProvider.city,
            keyboardType: TextInputType.text,
            lblText: 'City*',
            maxLength: 20,
            obscureText: false,
            textInputAction: TextInputAction.next,
          ),
          MyTextField(
            autoFocus: true,
            controller: checkoutProvider.area,
            keyboardType: TextInputType.text,
            lblText: 'Area*',
            maxLength: 50,
            obscureText: false,
            textInputAction: TextInputAction.next,
          ),
          MyTextField(
            autoFocus: true,
            controller: checkoutProvider.pincode,
            keyboardType: TextInputType.number,
            lblText: 'Pincode',
            maxLength: 10,
            obscureText: false,
            textInputAction: TextInputAction.next,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MyGoogleMap();
                    }));
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 15,
                      color: Color(0xFFF0f5e9c),
                      child: Center(
                        child: Text("Set Location",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      )),
                ),
                ListTile(
                    title: Text("Address Type*",
                        style: TextStyle(
                            color: Color(0xFFF0f5e9c), fontSize: 18))),
                RadioListTile(
                  value: AddressType.Home,
                  groupValue: myType,
                  onChanged: (value) {
                    setState(() {
                      myType = value;
                    });
                  },
                  title: Text("Home",
                      style:
                          TextStyle(color: Color(0xFFF0f5e9c), fontSize: 16)),
                  secondary: Icon(Icons.home, color: Color(0xFFF0f5e9c)),
                ),
                RadioListTile(
                  value: AddressType.Office,
                  groupValue: myType,
                  onChanged: (value) {
                    setState(() {
                      myType = value;
                    });
                  },
                  title: Text("Office",
                      style:
                          TextStyle(color: Color(0xFFF0f5e9c), fontSize: 16)),
                  secondary: Icon(Icons.work, color: Color(0xFFF0f5e9c)),
                ),
                RadioListTile(
                    value: AddressType.Others,
                    groupValue: myType,
                    onChanged: (value) {
                      setState(() {
                        myType = value;
                      });
                    },
                    title: Text("Others",
                        style:
                            TextStyle(color: Color(0xFFF0f5e9c), fontSize: 16)),
                    secondary:
                        Icon(Icons.other_houses, color: Color(0xFFF0f5e9c))),
              ],
            ),
          ),
        ]));
  }
}
