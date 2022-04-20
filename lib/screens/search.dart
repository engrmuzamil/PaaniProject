import 'package:flutter/material.dart';
import 'package:panni/models/product_model.dart';
import 'package:panni/providers/product_provider.dart';
import 'package:panni/screens/Widgets/searchproduct.dart';

class SearchItem extends StatefulWidget {
  final List<ProductModel> productList;
  const SearchItem({Key? key, required this.productList}) : super(key: key);

  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  String query = "NULL";
  late List<ProductModel> productListToDisplay;
  List<ProductModel> SearchProduct(String query) {
    List<ProductModel> searchProduct = widget.productList
        .where((element) => element.productName.toLowerCase().contains(query))
        .toList();
    return searchProduct;
  }

  @override
  Widget build(BuildContext context) {
    if (query == "NULL") {
      productListToDisplay = widget.productList;
    } else {
      productListToDisplay = SearchProduct(query);
    }
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFFF0f5e9c),
            title: Text(
              "Search",
              style: TextStyle(color: Colors.white),
            ),
            actionsIconTheme: IconThemeData(color: Colors.white, size: 30),
            actions: [
              Icon(Icons.menu, color: Colors.white),
            ]),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                "Items",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFF0f5e9c),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height / 6,
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 12),
                child: TextField(
                  onChanged: (value) => {
                    setState(() {
                      query = value.toLowerCase();
                    })
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Color.fromARGB(96, 15, 95, 156),
                    filled: true,
                    hintText: "Search Item Here....",
                    suffixIcon: Icon(Icons.search),
                  ),
                )),
            Column(
              children: productListToDisplay
                  .map((data) => MySearchProduct(
                      productImage: data.productImage,
                      productName: data.productName,
                      onTap: () {},
                      productPrice: data.productPrice))
                  .toList(),
            ),
          ],
        ));
  }
}
