import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Addressbook.dart';

class Review extends StatefulWidget {
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  bool promoflag = false;
  int i = 0;
  void promo() {
    setState(() {
      if (i == 0) {
        promoflag = true;
        i = 1;
      } else if (i == 1) {
        promoflag = false;
        i = 0;
      }
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                  padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Summary",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "3 Items",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                ), //container bta3 el order summary wel no. of items
                Container(
                  color: Colors.white24,
                  margin: EdgeInsets.fromLTRB(24, 12, 24, 12),
                  width: double.infinity,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Card(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          color: Colors.purple,
                          child: Text(
                            "first item",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          color: Colors.deepPurpleAccent,
                          child: Text(
                            "second item",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          color: Colors.deepPurple,
                          child: Text(
                            "third item",
                            style: TextStyle(fontSize: 25),
                          ),
                        ),
                      ],
                    ),
                  ),
                ), //container bta3 el items to buy
                Container(
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                  padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ship and Bill to",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ), //container bta3 el ship and bill to
                StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('customer')
                        .doc(selectedAddress)
                        .snapshots(),
                    builder: (context, document) {
                      if (!document.hasData) {
                        return Text('No Address added yet');
                      }
                      switch (document.connectionState) {
                        case ConnectionState.waiting:
                          return CircularProgressIndicator();
                          break;
                        default:
                          return ListView(
                            shrinkWrap: true,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.purple[100],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                margin: EdgeInsets.fromLTRB(12, 8, 12, 4),
                                padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                                child: Column(
                                  children: [
                                    Text(
                                      document.data['Name'],
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(document.data['City'],
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                    Text(document.data['Address'],
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                    Text(document.data['Phone Number'],
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black))
                                  ],
                                ),
                              )
                            ],
                          );
                      }
                    }),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: Column(
                      children: [
                        FlatButton(
                          onPressed: promo,
                          child: Text(
                            "Having a Promo Code",
                            style: TextStyle(
                                fontSize: 25,
                                color: Colors.purple,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Visibility(
                          visible: promoflag,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: TextField(
                              decoration: InputDecoration(
                                  labelText: "Enter the Promo Code",
                                  labelStyle: TextStyle(fontSize: 20)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ), //container of the promo code
                Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.purple,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ), // container el totalhead
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(30, 2, 30, 2),
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Column(
                      children: [
                        Card(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          color: Colors.white70,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Subtotal',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: CupertinoColors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '\$505.50',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: CupertinoColors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ), // row of subtotal
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Taxes',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: CupertinoColors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '\$0.0',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: CupertinoColors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ), // row of taxes
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Shipping',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: CupertinoColors.black,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      'Free',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: CupertinoColors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ), // row of shipping
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: CupertinoColors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '\$505.50',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: CupertinoColors.black,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ), // row of total
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ), //container el toral with money
                Container(
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.purple,
                    child: Text(
                      "Order Now",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)),
                  ),
                ), //container that contains the button order now
              ],
            ),
          ),
        ),
      ),
    );
  }
}
