import 'package:flutter/material.dart';
import 'package:panni/screens/Widgets/counterWidget.dart';

class MyProduct extends StatelessWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productId;
  final Function onTap;
  const MyProduct({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.onTap,
    required this.productPrice,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, bottom: 15, right: 5, top: 15),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              border: Border.all(width: 1, color: Color(0xFFF0f5e9c)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(productImage),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  // child: Image.network(
                  //   productImage,
                  //   fit: BoxFit.cover,
                  // ),
                  // ),
                ),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Text(productName,
                            style: TextStyle(
                              color: Color(0xFFF0f5e9c),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(productPrice.toString() + "Rs./Tank",
                            style: TextStyle(
                              color: Color.fromARGB(255, 106, 135, 160),
                              fontSize: 14,
                            ))
                      ],
                    )),
                Expanded(
                    child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.37,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0xFFF0f5e9c)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("10L",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFF0f5e9c),
                                    fontWeight: FontWeight.bold)),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Color(0xFFF0f5e9c),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.37,
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0xFFF0f5e9c)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: CounterWidget(
                          productId: productId,
                          productImage: productImage,
                          productName: productName,
                          productPrice: productPrice,

                        ),
                      ),
                    ),
                  ],
                )),
                SizedBox(height: 10),
              ],
            )),
      ),
    );
  }
}
