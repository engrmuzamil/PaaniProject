import 'package:flutter/material.dart';
import 'package:panni/providers/user_provider.dart';
import 'package:panni/screens/cart.dart';
import 'package:panni/screens/home.dart';
import 'package:panni/screens/profile.dart';
import 'package:panni/screens/whishlist.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserProvider userProvider = Provider.of(context, listen: false);
    userProvider.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context);
    var userData = userProvider.userModelData;

    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
            child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF0f5e9c),
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(100),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: userData.userImage.isNotEmpty
                      ? Image.network(userData.userImage, fit: BoxFit.cover)
                      : Image.asset("assets/logo.png",
                          fit: BoxFit.cover)),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Container(
                child: Column(children: <Widget>[
                  Text("Welcome,\n${userData.userName}",
                      style: TextStyle(
                          color: Color(0xFFF0f5e9c),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.2,
                  //   height: MediaQuery.of(context).size.height / 20,
                  //   decoration: BoxDecoration(
                  //       border: Border.all(width: 1, color: Color(0xFFF0f5e9c)),
                  //       borderRadius: BorderRadius.circular(15)),
                  // child: Center(
                  //   child: Text(" Login ",
                  //       style: TextStyle(
                  //           color: Color.fromARGB(255, 108, 121, 131),
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w300)),
                  // ),
                  // ),
                ]),
              ),
            )
          ],
        )),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: ListTile(
            title: Text("Home",
                style: TextStyle(color: Color(0xFFF0f5e9c), fontSize: 16)),
            leading: Icon(Icons.home, color: Color(0xFFF0f5e9c), size: 30),
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 178, 206, 230),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          },
          child: ListTile(
            title: Text("Review Cart",
                style: TextStyle(color: Color(0xFFF0f5e9c), fontSize: 16)),
            leading:
                Icon(Icons.shopping_cart, color: Color(0xFFF0f5e9c), size: 30),
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 178, 206, 230),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Profile(
                          userData: userData,
                        )));
          },
          child: ListTile(
            title: Text("My Profile",
                style: TextStyle(color: Color(0xFFF0f5e9c), fontSize: 16)),
            leading: Icon(Icons.person, color: Color(0xFFF0f5e9c), size: 30),
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 178, 206, 230),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          },
          child: ListTile(
            title: Text("Notofications",
                style: TextStyle(color: Color(0xFFF0f5e9c), fontSize: 16)),
            leading:
                Icon(Icons.notifications, color: Color(0xFFF0f5e9c), size: 30),
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 178, 206, 230),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          },
          child: ListTile(
            title: Text("Rating and Review",
                style: TextStyle(color: Color(0xFFF0f5e9c), fontSize: 16)),
            leading: Icon(Icons.star, color: Color(0xFFF0f5e9c), size: 30),
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 178, 206, 230),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Whishlist()));
          },
          child: ListTile(
            title: Text("Whishlist",
                style: TextStyle(color: Color(0xFFF0f5e9c), fontSize: 16)),
            leading: Icon(Icons.favorite, color: Color(0xFFF0f5e9c), size: 30),
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 178, 206, 230),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          },
          child: ListTile(
            title: Text("Raise a Complain",
                style: TextStyle(color: Color(0xFFF0f5e9c), fontSize: 16)),
            leading:
                Icon(Icons.note_sharp, color: Color(0xFFF0f5e9c), size: 30),
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 178, 206, 230),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
          },
          child: ListTile(
            title: Text("FAQ's",
                style: TextStyle(color: Color(0xFFF0f5e9c), fontSize: 16)),
            leading: Icon(Icons.question_answer,
                color: Color(0xFFF0f5e9c), size: 30),
          ),
        ),
        Divider(
          color: Color.fromARGB(255, 178, 206, 230),
        ),
        Center(
          child: Text("Contact Support",
              style: TextStyle(color: Color(0xFFF0f5e9c), fontSize: 20)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: Text("Call Us: +92 316 92 75 329",
              style: TextStyle(color: Color(0xFFF0f5e9c), fontSize: 16)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: Text("Email Us: waveit@gmail.com",
              style: TextStyle(color: Color(0xFFF0f5e9c), fontSize: 16)),
        ),
      ],
    ));
  }
}
