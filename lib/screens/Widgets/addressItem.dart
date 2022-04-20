import 'package:flutter/material.dart';

class AddressItem extends StatelessWidget {
  final String title, addressType, address, phoneNumber;
  final Function onTap;
  final bool isCheckout;
  const AddressItem({
    Key? key,
    required this.title,
    required this.addressType,
    required this.address,
    this.isCheckout = true,
    required this.phoneNumber,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "${title}",
                  style: TextStyle(color: Color(0xFFF0f5e9c)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height / 20,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Color(0xFFF0f5e9c),
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text("${addressType}",
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                ),
              ],
            ),
            leading: isCheckout
                ? Icon(Icons.forward, color: Color(0xFFF0f5e9c))
                : Icon(Icons.location_on, color: Color(0xFFF0f5e9c)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${address}",
                  style: TextStyle(color: Color.fromARGB(137, 15, 95, 156)),
                ),
                SizedBox(height: 5),
                Text(
                  "${phoneNumber}",
                  style: TextStyle(color: Color.fromARGB(132, 15, 95, 156)),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Divider(
              color: Color(0xFFF0f5e9c),
              thickness: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
