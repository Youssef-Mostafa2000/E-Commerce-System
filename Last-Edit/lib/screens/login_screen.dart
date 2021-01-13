import 'package:c_e_commerce/screens/homepage.dart';
import 'package:c_e_commerce/screens/sellerhome.dart';
import 'package:c_e_commerce/screens/signup_screen.dart';
import 'package:c_e_commerce/services/auth.dart';
import 'package:c_e_commerce/services/google_auth.dart';
import 'package:c_e_commerce/widgets/mytextfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class loginscreen extends StatefulWidget {
  static String id = 'loginscreen';

  @override
  _loginscreenState createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  final GlobalKey<FormState> globalkey = GlobalKey<FormState>();

  String _email, _password;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth auth_google = FirebaseAuth.instance;
  final _auth = Auth();
  bool _isadmin = false;
  final adminpassword = 'admin1234';
  bool isguest = false;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

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
                        'Stop & Shop',
                        style: TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Mytextwidget(
              key: Key("email-field"),
              onClick: (value) {
                _email = value;
              },
              hint: 'Enter your email here',
              icon: Icons.email,
            ),
            SizedBox(height: 10),
            Mytextwidget(
              key: Key("password-field"),
              onClick: (value) {
                _password = value;
              },
              hint: 'Enter your password here',
              icon: Icons.lock,
            ),
            SizedBox(height: 20),
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

                      if (!_isadmin) {
                        if (true) {
                          try {
                            final authresult =
                                await _auth.signIn(_email, _password);
                            Navigator.pushNamed(context, Sellerhome.id);
                          } catch (e) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(e.message),
                            ));
                          }
                        } else {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('something went wrong'),
                          ));
                        }
                      } else {
                        try {
                          final authresult =
                              await _auth.signIn(_email, _password);
                          Navigator.pushNamed(context, HomePage.id,
                              arguments: isguest);
                        } catch (e) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text(e.message),
                          ));
                        }
                      }
                    }
                  },
                  color: Colors.white,
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () async {
                  await signInWithGoogle();
                  Navigator.pushNamed(context, HomePage.id, arguments: isguest);
                },
                color: Colors.white,
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
                      'Sign in with Google',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
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
                  'Do not have account?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  //color: Colors.purple,

                  onTap: () {
                    Navigator.pushNamed(context, signupscreen.id);
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isadmin = true;
                        });

                        print(_isadmin);
                      },
                      child: Text(
                        'I am a Seller',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: (_isadmin) ? Colors.purple : Colors.white,
                            decoration: TextDecoration.underline,

                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isadmin = false;
                        });
                      },
                      child: Text(
                        'I am an User',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: _isadmin ? Colors.white : Colors.purple,
                            decoration: TextDecoration.underline,

                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               Container(




                 child: FlatButton (
                   color: Colors.white,
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(18.0),

                       side: BorderSide(color: Colors.red)),


                    onPressed: () {
                      bool isguest = true;
                      Navigator.pushNamed(context, HomePage.id,
                          arguments: isguest);
                    },
                    child: Text(
                      'Login as guest',
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
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
