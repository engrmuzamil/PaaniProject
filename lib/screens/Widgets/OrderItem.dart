import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final String name, paymentMethod, address, orderID;
  final int totalAmount;
  final String mobileNumber;
  final Function onTap;
  const OrderItem(
      {Key? key,
      required this.orderID,
      required this.paymentMethod,
      required this.address,
      required this.totalAmount,
      required this.mobileNumber,
      required this.name,
      required this.onTap})
      : super(key: key);

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
                  "${orderID}",
                  style: TextStyle(color: Color(0xFFF0f5e9c)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height / 20,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Color(0xFFF0f5e9c),
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text("${paymentMethod}",
                        style: TextStyle(fontSize: 12, color: Colors.white)),
                  ),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${name}",
                  style: TextStyle(color: Color.fromARGB(137, 15, 95, 156)),
                ),
                Text(
                  "${mobileNumber}",
                  style: TextStyle(color: Color.fromARGB(132, 15, 95, 156)),
                ),
                Text(
                  "${address}",
                  style: TextStyle(color: Color.fromARGB(137, 15, 95, 156)),
                ),
                SizedBox(height: 5),
                Text(
                  "TotalAmount: ${totalAmount}",
                  style: TextStyle(color: Color.fromARGB(137, 15, 95, 156)),
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
