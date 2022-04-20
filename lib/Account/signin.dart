import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:panni/providers/user_provider.dart';
import 'package:panni/screens/home.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    Future<User?> _googleSignUp() async {
      try {
        final GoogleSignIn _googleSignIn = GoogleSignIn(
          scopes: ['email'],
        );
        final FirebaseAuth _auth = FirebaseAuth.instance;

        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser!.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final User? user = (await _auth.signInWithCredential(credential)).user;
        userProvider.addUser(
            user!, user.displayName, user.email, user.photoURL);

        return user;
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Color.fromARGB(255, 31, 119, 160).withOpacity(0.2),
                BlendMode.dstATop),
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'),
                radius: 50,
              ),
              Text(
                'P A N N I',
                style: TextStyle(
                  fontSize: 50,
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
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () async {
                  await _googleSignUp().then((value) =>
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage())));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height / 10,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xFFF0f5e9c)),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(children: <Widget>[
                    Image.asset(
                      "assets/google.png",
                      width: 100,
                      height: 50,
                    ),
                    Text('Sign in with Google',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xFFF0f5e9c))),
                  ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "By Siging in, you Agree to our Terms and Conditions",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
