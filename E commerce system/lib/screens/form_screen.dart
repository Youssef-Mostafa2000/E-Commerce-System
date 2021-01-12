import 'package:c_e_commerce/screens/Addressbook.dart';
import 'package:c_e_commerce/screens/checkout.dart';
import 'package:c_e_commerce/screens/delivery_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:c_e_commerce/models/order.dart';

String firstName = "";
String lastName = "";
String address = "";
String additionalInfo = "";
String phoneNumber = "";
String city = "";
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController addressController = TextEditingController();
TextEditingController phoneController = TextEditingController();

class FormScreen extends StatefulWidget {
  static String id = 'formscreen';
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final Future<FirebaseApp> _initialization = FirebaseApp.configure();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropValCity = null;
  String dropValPhone = null;

  void dropChangeCity(value) {
    setState(() {
      dropValCity = value;
    });
  }

  void dropChangePhone(value) {
    setState(() {
      dropValPhone = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Order order = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(12, 8, 4, 4),
                    color: Colors.purple[100],
                    child:
                        /*Text(
                    "ADDRESS DETAILS                                                           * Required",
                  ),*/
                        Row(
                      children: [
                        Text(
                          'ADDRESS DETAILS',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '* Required',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                _buildFirstName(),
                _buildLastName(),
                _buildAddress(),
                _buildAdditionalinfo(),
                Container(
                  padding: EdgeInsets.fromLTRB(12, 4, 12, 20),
                  child: DropdownButtonFormField(
                    value: dropValCity,
                    hint: Text('Select your city'),
                    decoration: InputDecoration(
                      labelText: 'City',
                      labelStyle: TextStyle(fontSize: 20),
                      contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    ),
                    onChanged: dropChangeCity,
                    items: <String>['Cairo', 'Giza', 'Alexandria']
                        .map<DropdownMenuItem>((String value) {
                      return DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      width: 130,
                      padding: EdgeInsets.fromLTRB(12, 4, 0, 12),
                      child: DropdownButtonFormField(
                        value: dropValPhone,
                        hint: Text('Code'),
                        decoration: InputDecoration(
                          labelText: 'Country Code',
                          labelStyle: TextStyle(fontSize: 20),
                          contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        ),
                        onChanged: dropChangePhone,
                        items: <String>['+20', '+966', '+967']
                            .map<DropdownMenuItem>((String value) {
                          return DropdownMenuItem<String>(
                            child: Text(value),
                            value: value,
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 80,
                      width: 250,
                      padding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                      child: TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.star_rounded,
                              size: 15,
                            ),
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(fontSize: 20),
                            hintText: 'Enter your phone number',
                            hintStyle: TextStyle(fontSize: 20),
                            alignLabelWithHint: true,
                            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          ),
                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your phone number';
                            } else if (value.length < 9) {
                              return 'Your number must contain at least 10 digits';
                            }
                          }),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  color: Colors.white70,
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                  child: Container(
                      color: Colors.white,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)),
                        color: Colors.purple,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            final _addresult = await Firestore.instance
                                .collection('customer')
                                .add({
                              'Name': firstNameController.text +
                                  " " +
                                  lastNameController.text,
                              'Address': addressController.text,
                              'City': dropValCity,
                              'Phone Number':
                                  dropValPhone + phoneController.text
                            });
                            Navigator.pushNamed(
                              context,
                              Addressproject.id,
                              arguments: order,
                            );
                          }
                        },
                        child: Text(
                          "SAVE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Add New Address",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.purple,
        shadowColor: Colors.grey,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ),
    );
  }
}

Widget _buildFirstName() {
  return Container(
    padding: EdgeInsets.fromLTRB(12, 12, 12, 20),
    child: TextFormField(
      decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.star_rounded,
            size: 20,
          ),
          labelText: 'First Name',
          labelStyle: TextStyle(fontSize: 25),
          hintText: 'Enter your first name',
          hintStyle: TextStyle(fontSize: 20),
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
      keyboardType: TextInputType.name,
      controller: firstNameController,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a valid name';
        }
      },
    ),
  );
}

Widget _buildLastName() {
  return Container(
    padding: EdgeInsets.fromLTRB(12, 4, 12, 20),
    child: TextFormField(
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.star_rounded,
              size: 20,
            ),
            labelText: 'Last Name',
            labelStyle: TextStyle(fontSize: 25),
            hintText: 'Enter your last name',
            hintStyle: TextStyle(fontSize: 20),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
        keyboardType: TextInputType.name,
        controller: lastNameController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a valid name';
          }
        }),
  );
}

Widget _buildAddress() {
  return Container(
    padding: EdgeInsets.fromLTRB(12, 4, 12, 20),
    child: TextFormField(
        decoration: InputDecoration(
            suffixIcon: Icon(
              Icons.star_rounded,
              size: 20,
            ),
            labelText: 'Address Info',
            labelStyle: TextStyle(fontSize: 25),
            hintText: 'Enter your full address information',
            hintStyle: TextStyle(fontSize: 20),
            alignLabelWithHint: true,
            contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
        keyboardType: TextInputType.name,
        controller: addressController,
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter your address';
          }
        }),
  );
}

Widget _buildAdditionalinfo() {
  return Container(
    padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
    child: TextFormField(
      decoration: InputDecoration(
          labelText: 'Additional Info',
          labelStyle: TextStyle(fontSize: 25),
          hintText: 'Additional Info',
          hintStyle: TextStyle(fontSize: 20),
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
      keyboardType: TextInputType.name,
      onSaved: (newValue) {
        additionalInfo = newValue;
      },
    ),
  );
}
