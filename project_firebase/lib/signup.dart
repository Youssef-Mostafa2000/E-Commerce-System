import 'package:flutter/material.dart';
import 'package:project_firebase/dashboard.dart';
import 'package:project_firebase/login.dart';
import 'signup.dart';
import 'login.dart';
import 'dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.fromLTRB(8, 8, 8, 16),
        child: Column(
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                          labelText: 'First Name',
                          labelStyle: TextStyle(fontSize: 20),
                          hintText: 'Enter your first name',
                          hintStyle: TextStyle(fontSize: 20)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter a valid name';
                        }
                      },
                    ),
                    TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                            labelText: 'Last Name',
                            labelStyle: TextStyle(fontSize: 20),
                            hintText: 'Enter your last name',
                            hintStyle: TextStyle(fontSize: 20)),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter a valid name';
                          }
                        }),
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
                child: Text('Sign Up', style: TextStyle(color: Colors.white)),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    var result = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordNameController.text);
                    if (result != null) {
                      FirebaseFirestore.instance.collection('users').doc().set({
                        'first name': _firstNameController.text,
                        'last name': _lastNameController.text,
                        'email': _emailController.text,
                      });
                      Navigator.pushNamed(context, 'login');
                    }
                  }
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
