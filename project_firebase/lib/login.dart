import 'package:flutter/material.dart';
import 'package:project_firebase/dashboard.dart';
import 'package:project_firebase/login.dart';
import 'signup.dart';
import 'login.dart';
import 'dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Column(children: [
          Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: 'E-mail Address',
                          labelStyle: TextStyle(fontSize: 20),
                          hintText: 'Enter your e-mail address',
                          hintStyle: TextStyle(fontSize: 20)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter e-mail address';
                        }
                      }),
                  TextFormField(
                      controller: _passwordNameController,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(fontSize: 20),
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(fontSize: 20)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter password';
                        } else if (value.length < 5) {
                          return 'Pasword must contain at least 6 digits';
                        }
                      }),
                ],
              )),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: RaisedButton(
              color: Colors.green,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  var result = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordNameController.text);
                  if (result != null) {
                    Navigator.pushNamed(context, 'dashboard');
                  } else {
                    print('Enter correct data');
                  }
                }
              },
            ),
          ),
        ]),
      )),
    );
  }
}
