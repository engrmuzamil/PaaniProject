import 'package:flutter/material.dart';
import 'package:panni/providers/product_provider.dart';
import 'package:panni/screens/Widgets/appbar.dart';
import 'package:panni/screens/Widgets/drawer.dart';
import 'package:panni/screens/Widgets/product.dart';
import 'package:panni/screens/allProducts.dart';
import 'package:panni/screens/productpage.dart';
import 'package:panni/screens/search.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchProductData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of(context);

    // productProvider = Provider.of(context);
    return Scaffold(
        drawer: MyDrawer(),
        appBar: MyAppBar(
          title: "Home",
          isHome: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: Color(0xFFF0f5e9c),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("assets/water.jpg",
                              fit: BoxFit.fill)),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 30,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/logo.png'),
                      radius: 20,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 80,
                    child: Text(
                      'P A N N I',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF0f5e9c),
                        shadows: [
                          Shadow(
                            color: Color(0xFFF0f5e9c),
                            blurRadius: 20,
                            offset: Offset(5, 5),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 30,
                      left: 30,
                      child: Text(
                        "\t\t\t  100% Pure\n Water Delivered",
                        style: TextStyle(
                            color: Color(0xFFF0f5e9c),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Featured Water",
                        style: TextStyle(
                          color: Color.fromARGB(255, 8, 55, 90),
                          fontSize: 14,
                        )),
                    InkWell(
                      onTap: () {},
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchItem(
                                        productList:
                                            productProvider.getProductList,
                                      )));
                        },
                        child: Text("View All",
                            style: TextStyle(
                              color: Color.fromARGB(255, 144, 163, 179),
                              fontSize: 12,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: productProvider.getProductList.map((data) {
                    return MyProduct(
                      productImage: data.productImage,
                      productName: data.productName,
                      productPrice: data.productPrice,
                      productId: data.productId,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetail(
                                    productImage: data.productImage,
                                    productName: data.productName,
                                    productPrice: data.productPrice, productQuantity: 1, productId: data.productId,
                                    
                                    )));
                      },
                    );
                  }).toList(),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: <Widget>[
              //       Text("Featured Water",
              //           style: TextStyle(
              //             color: Color.fromARGB(255, 8, 55, 90),
              //             fontSize: 14,
              //           )),
              //       Text("View All",
              //           style: TextStyle(
              //             color: Color.fromARGB(255, 144, 163, 179),
              //             fontSize: 12,
              //           )),
              //     ],
              //   ),
              // ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: productProvider.getProductList.map((data) {
              //       return MyProduct(
              //         productImage: data.productImage,
              //         productName: data.productName,
              //         productPrice: data.productPrice,
              //         onTap: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => ProductDetail(
              //                       productImage: data.productImage,
              //                       productName: data.productName,
              //                       productPrice: data.productPrice)));
              //         },
              //       );
              //     }).toList(),
              //   ),
              // ),
            ],
          ),
        ));
  }
}
