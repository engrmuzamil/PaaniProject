import 'package:flutter/material.dart';
import 'package:panni/models/product_model.dart';

class MySearchProduct extends StatelessWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final Function onTap;
  const MySearchProduct({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.onTap,
    required this.productPrice,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, top: 5),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  productImage,
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
                    Text(productName,
                        style: TextStyle(
                          color: Color(0xFFF0f5e9c),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(productPrice.toString() + "Rs./Tank",
                        style: TextStyle(
                          color: Color.fromARGB(255, 106, 135, 160),
                          fontSize: 14,
                        )),
                    SizedBox(height: 20),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.17,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xFFF0f5e9c)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("10L",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFFF0f5e9c))),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFFF0f5e9c),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.17,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xFFF0f5e9c)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("ADD",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFFF0f5e9c))),
                          Icon(
                            Icons.add,
                            color: Color(0xFFF0f5e9c),
                            size: 15,
                          ),
                        ],
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
