import 'dart:math';
import 'package:c_e_commerce/screens/form_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'checkout.dart';
import 'package:c_e_commerce/models/order.dart';

String selectedAddress = null;

class Addressproject extends StatefulWidget {
  static String id = 'addressproject';
  _AddressprojectState createState() => _AddressprojectState();
}

class _AddressprojectState extends State<Addressproject> {
  final Future<FirebaseApp> _initialization = FirebaseApp.configure();
  String radioVal;

  void radiochecked(val) {
    setState(() {
      radioVal = val;
      selectedAddress = val;
    });
    print(selectedAddress);
  }

  bool isChecked(value) {
    if (value == radioVal)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    Order order = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Address book",
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreamBuilder(
                  stream: Firestore.instance.collection('customer').snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> document) {
                    if (!document.hasData) {
                      return Text('No Address added yet');
                    }
                    switch (document.connectionState) {
                      default:
                        return ListView(
                            shrinkWrap: true,
                            children: document.data.documents.map((data) {
                              String user_id = data.documentID;
                              return Container(
                                decoration: BoxDecoration(
                                    color: Colors.purple[100],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                margin: EdgeInsets.fromLTRB(8, 8, 8, 6),
                                padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    RadioListTile(
                                      activeColor: Colors.purple,
                                      value: user_id,
                                      groupValue: radioVal,
                                      onChanged: radiochecked,
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(data['Name'],
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold)),
                                          Text(data['City'],
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black)),
                                          Text(data['Address'],
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black)),
                                          Text(data['Phone Number'],
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black))
                                        ],
                                      ),
                                      secondary: IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          Firestore.instance
                                              .collection('customer')
                                              .document(data.documentID)
                                              .delete();
                                        },
                                      ),
                                    ),
                                    Visibility(
                                      visible: isChecked(user_id),
                                      child: Container(
                                        margin: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            color: Colors.purple[100],
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        padding:
                                            EdgeInsets.fromLTRB(20, 0, 0, 0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                ],
                                              ),
                                            ), // defult address
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'This is your Defult Address',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.purple,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList());
                    }
                  }),
              Container(
                margin: EdgeInsets.only(top: 6),
                alignment: Alignment.center,
                color: Colors.white,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                    color: Colors.purple,
                    child: Text(
                      'SELECT THIS ADDRESS',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CheckoutScreen(selectedAddress, order)));
                    }),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(top: 6),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, FormScreen.id,
                            arguments: order); //edit here
                      },
                      color: Colors.purple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_circle,
                            color: Colors.white,
                            size: 25.0,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'Add New Address',
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ) //container bta3 add address
            ],
          ),
        ),
      ),
    );
  }
}

class SelectAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.purple[100],
          borderRadius: BorderRadius.all(Radius.circular(8))),
      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.purple,
                ),
              ],
            ),
          ), // defult address
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'This is your Defult Address',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
