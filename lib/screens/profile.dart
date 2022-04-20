import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:panni/Account/signin.dart';
import 'package:panni/Account/signout.dart';
import 'package:panni/models/usermodel.dart';
import 'package:panni/screens/Widgets/appbar.dart';
import 'package:panni/screens/Widgets/drawer.dart';

class Profile extends StatefulWidget {
  final UserModel userData;
  const Profile({Key? key, required this.userData}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signOut() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: "My Profile",
        isHome: false,
      ),
      drawer: const MyDrawer(),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: const Color(0xFFF0f5e9c),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: const Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 6.7,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 15,
            left: MediaQuery.of(context).size.width / 10,
            child: CircleAvatar(
              radius: 70,
              backgroundColor: const Color(0xFFF0f5e9c),
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(widget.userData.userImage),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3.75,
            left: MediaQuery.of(context).size.width / 3,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.userData.userName,
                        style: const TextStyle(
                            color: const Color(0xFFF0f5e9c),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      const CircleAvatar(
                          backgroundColor: Color(0xFFF0f5e9c),
                          radius: 15,
                          child:
                              Icon(Icons.edit, color: Colors.white, size: 18)),
                    ],
                  ),
                  Text(
                    widget.userData.userEmail,
                    style: const TextStyle(
                        color: const Color.fromARGB(146, 20, 126, 207),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height / 2.75,
              left: MediaQuery.of(context).size.width / 20,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: const Color(0xFFF0f5e9c),
                        ),
                        const ListTile(
                          leading: const Icon(Icons.shopping_bag_outlined,
                              color: const Color(0xFFF0f5e9c)),
                          title: const Text(
                            "My Orders",
                            style: TextStyle(
                                color: Color(0xFFF0f5e9c),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: const Color(0xFFF0f5e9c),
                          ),
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color(0xFFF0f5e9c),
                        ),
                        const ListTile(
                          leading: const Icon(Icons.location_on_outlined,
                              color: Color(0xFFF0f5e9c)),
                          title: Text(
                            "My Delivery Address",
                            style: TextStyle(
                                color: const Color(0xFFF0f5e9c),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFF0f5e9c),
                          ),
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: const Color(0xFFF0f5e9c),
                        ),
                        const ListTile(
                          leading: const Icon(Icons.person_outline,
                              color: const Color(0xFFF0f5e9c)),
                          title: const Text(
                            "Refer A Friend",
                            style: TextStyle(
                                color: Color(0xFFF0f5e9c),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: const Color(0xFFF0f5e9c),
                          ),
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color(0xFFF0f5e9c),
                        ),
                        const ListTile(
                          leading: const Icon(Icons.file_copy_outlined,
                              color: Color(0xFFF0f5e9c)),
                          title: Text(
                            "Terms And Conditions",
                            style: const TextStyle(
                                color: const Color(0xFFF0f5e9c),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFF0f5e9c),
                          ),
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: Color(0xFFF0f5e9c),
                        ),
                        const ListTile(
                          leading: const Icon(Icons.privacy_tip_outlined,
                              color: const Color(0xFFF0f5e9c)),
                          title: const Text(
                            "Privacy Policy",
                            style: TextStyle(
                                color: Color(0xFFF0f5e9c),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: const Color(0xFFF0f5e9c),
                          ),
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: const Color(0xFFF0f5e9c),
                        ),
                        const ListTile(
                          leading:
                              Icon(Icons.add_chart, color: Color(0xFFF0f5e9c)),
                          title: Text(
                            "About",
                            style: TextStyle(
                                color: const Color(0xFFF0f5e9c),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xFFF0f5e9c),
                          ),
                        ),
                        const Divider(
                          height: 1,
                          thickness: 1,
                          color: const Color(0xFFF0f5e9c),
                        ),
                        InkWell(
                          onTap: () async {
                            Authentication.signOut(context: context);
                            // print("Logout");
                            // await _signOut();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignIn()),
                                (route) => false);
                          },
                          child: const ListTile(
                            leading: const Icon(Icons.logout_outlined,
                                color: Color(0xFFF0f5e9c)),
                            title: Text(
                              "Logout",
                              style: const TextStyle(
                                  color: Color(0xFFF0f5e9c),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xFFF0f5e9c),
                            ),
                          ),
                        ),
                      ]),
                ),
              ))
        ],
      ),
    );
  }
}
