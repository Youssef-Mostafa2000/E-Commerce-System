import 'package:c_e_commerce/screens/form_screen.dart';
import 'package:c_e_commerce/services/google_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Addressbook.dart';
import 'package:c_e_commerce/models/order.dart';

class DeliveryScreen extends StatefulWidget {
  static String id = 'delivery screen';
  Order order;
  String _user_id;
  DeliveryScreen(this._user_id, order);
  @override
  _DeliveryScreenState createState() => _DeliveryScreenState(_user_id, order);
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  final Future<FirebaseApp> _initialization = FirebaseApp.configure();
  Order order;
  String _user_id;
  var val;
  //Order order = ModalRoute.of(context).settings.arguments;

  _DeliveryScreenState(this._user_id, this.order);
  void radiochecked(int val) {
    setState(() {
      radioVal = val;
    });
  }

  @override
  void initState() {
    _user_id = selectedAddress;
    val = '';
    //selectedAddress = '64JiC4IUlz7aCZsJkAXz';
  }

  int radioVal = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(8, 12, 8, 8),
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 4, 0, 8),
                    padding: EdgeInsets.fromLTRB(8, 8, 90, 0),
                    color: Colors.purple,
                    child: Text(
                      'ADDRESS DETAILS',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.purple,
                    margin: EdgeInsets.fromLTRB(0, 4, 0, 0),
                    padding: EdgeInsets.fromLTRB(8, 8, 0, 8),
                    child: GestureDetector(
                        child: Text(
                          'CHANGE',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () async {
                          // Navigator.pop(context); // edit here
                          /*val = Navigator.pushNamed<String>(
                              context, Addressproject.id,
                              arguments: order);*/

                          val = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Addressproject()));
                        }),
                  )
                ],
              ),
            ),
            StreamBuilder(
                stream: Firestore.instance
                    .collection('customer')
                    .document(_user_id)
                    .snapshots(),
                builder: (context, document) {
                  if (!document.hasData || _user_id == null) {
                    return Text('No Address added yet');
                  }
                  switch (document.connectionState) {
                    case ConnectionState.none:
                      return Text('');
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
                            margin: EdgeInsets.fromLTRB(12, 4, 12, 4),
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
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.fromLTRB(8, 8, 8, 0),
              padding: EdgeInsets.fromLTRB(16, 12, 8, 12),
              child: Text(
                'SELECT A DELIVERY METHOD',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              margin: EdgeInsets.fromLTRB(12, 8, 12, 4),
              padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
              child: RadioListTile(
                value: 0,
                groupValue: radioVal,
                onChanged: radiochecked,
                title: Text(
                  'Door Delivery',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  children: [
                    Text('Delivered between 3-5 days',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    Text('Shipping Fee : EGP 25',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ],
                ),
                activeColor: Colors.purple,
                secondary: Icon(Icons.house),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              margin: EdgeInsets.fromLTRB(12, 8, 12, 4),
              padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
              child: RadioListTile(
                value: 1,
                groupValue: radioVal,
                onChanged: radiochecked,
                title: Text('Pickup Station',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                subtitle: Column(
                  children: [
                    Text('Available between 15 Jan - 2 Feb',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                    Text('Shipping Fee : EGP 15',
                        style: TextStyle(fontSize: 18, color: Colors.black)),
                  ],
                ),
                activeColor: Colors.purple,
                secondary: Icon(Icons.transfer_within_a_station),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
