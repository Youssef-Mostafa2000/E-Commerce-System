import 'package:c_e_commerce/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:c_e_commerce/constants.dart';
import 'package:c_e_commerce/screens/login_screen.dart';
import 'package:c_e_commerce/widgets/mytextfield.dart';
import 'package:c_e_commerce/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:c_e_commerce/services/google_auth.dart';

class signupscreen extends StatefulWidget {
  static String id = 'Signupscreen';

  @override
  _signupscreenState createState() => _signupscreenState();
}

class _signupscreenState extends State<signupscreen> {
  final GlobalKey<FormState> globalkey = GlobalKey<FormState>();

  String _email, _password, _name;

  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.purple,
      body: Form(
        key: globalkey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Container(
                height: MediaQuery.of(context).size.height * .3,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                          'https://cdn2.iconfinder.com/data/icons/seo-web-optimization-ultimate-part1/512/cart-2-512.png'),
                      height: 120,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Text(
                        'Online Shop',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Mytextwidget(
              onClick: (value) {
                _name = value;
              },
              hint: 'Enter your name here',
              icon: Icons.perm_identity,
            ),
            SizedBox(height: 20),
            Mytextwidget(
              onClick: (value) {
                _email = value;
              },
              hint: 'Enter your email here',
              icon: Icons.email,
            ),
            SizedBox(height: 20),
            Mytextwidget(
              onClick: (value) {
                _password = value;
              },
              hint: 'Enter your password here',
              icon: Icons.lock,
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: Builder(
                builder: (context) => FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(23),
                  ),
                  onPressed: () async {
                    if (globalkey.currentState.validate()) {
                      globalkey.currentState.save();

                      try {
                        final authresult =
                            await _auth.signUp(_email, _password);
                        Navigator.pushNamed(context, HomePage.id,
                            arguments: false);
                      } catch (e) {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(e.message),
                        ));
                      }
                    }
                  },
                  color: Colors.black,
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 90),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () async {
                  await signInWithGoogle();
                  Navigator.pushNamed(context, HomePage.id, arguments: false);
                },
                color: Colors.black,
                child: new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                          'https://img.icons8.com/fluent/2x/google-logo.png'),
                      height: 18,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Sign up with Google',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Do you have an account?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, loginscreen.id);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
