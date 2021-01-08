import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';

String firstName = "";
String lastName = "";
String address = "";
String additionalInfo = "";
String phoneNumber = "";
String city = "";

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
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
                  color: Colors.grey[300],
                  child: Text(
                    "ADDRESS DETAILS                                                           * Required",
                  ),
                ),
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
                        onSaved: (newValue) {
                          phoneNumber = newValue;
                        },
                      ),
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
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, 'address_book');
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
      onSaved: (newValue) {
        firstName = newValue;
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
      onSaved: (newValue) {
        lastName = newValue;
      },
    ),
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
      onSaved: (newValue) {
        address = newValue;
      },
    ),
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
