import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class Addressproject extends StatefulWidget {
  _AddressprojectState createState() => _AddressprojectState();
}

class _AddressprojectState extends State<Addressproject> {
  int radioVal;
  void radiochecked(int val) {
    setState(() {
      radioVal = val;
    });
  }

  bool isChecked(value) {
    if (value == radioVal)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
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
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                decoration: BoxDecoration(
                    color: Colors.purple[100],
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Column(
                  children: [
                    RadioListTile(
                        activeColor: Colors.purple,
                        secondary: FlatButton(
                          child: Text(
                            'Edit',
                            style:
                                TextStyle(fontSize: 22, color: Colors.purple),
                          ),
                          onPressed: () {
                            //Navigator.pushNamed(context, 'address_form');
                          },
                        ),
                        value: 0,
                        groupValue: radioVal,
                        onChanged: radiochecked,
                        title: Container(
                          decoration: BoxDecoration(
                              color: Colors.purple[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  'Youssef Mostafa',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // floating button of add and the name of client
                              Container(
                                  child: Column(
                                children: [
                                  Text(
                                    'Gamal Abd El-Nasser',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  Text(
                                    'Al Salam City',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  Text(
                                    '+201112367131',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              )), //Text of address
                            ],
                          ),
                        )),
                    // container bta3 esm el user wel 3enwan
                    Visibility(
                      visible: isChecked(0),
                      child: Container(
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
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                decoration: BoxDecoration(
                    color: Colors.purple[100],
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Column(
                  children: [
                    RadioListTile(
                        activeColor: Colors.purple,
                        secondary: FlatButton(
                          child: Text(
                            'Edit',
                            style:
                                TextStyle(fontSize: 22, color: Colors.purple),
                          ),
                          onPressed: () {
                            //Navigator.pushNamed(context, 'address_form');
                          },
                        ),
                        value: 1,
                        groupValue: radioVal,
                        onChanged: radiochecked,
                        title: Container(
                          decoration: BoxDecoration(
                              color: Colors.purple[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  'Mostafa Hammam',
                                  style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // floating button of add and the name of client
                              Container(
                                  child: Column(
                                children: [
                                  Text(
                                    'Emtedad ramsis Street',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  Text(
                                    'Nasr City',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  Text(
                                    '+201113194986',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              )), //Text of address
                            ],
                          ),
                        )),
                    // container bta3 esm el user wel 3enwan
                    Visibility(
                      visible: isChecked(1),
                      child: Container(
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
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                decoration: BoxDecoration(
                    color: Colors.purple[100],
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Column(
                  children: [
                    RadioListTile(
                        activeColor: Colors.purple,
                        secondary: FlatButton(
                          child: Text(
                            'Edit',
                            style:
                                TextStyle(fontSize: 22, color: Colors.purple),
                          ),
                          onPressed: () {
                            //Navigator.pushNamed(context, 'address_form');
                          },
                        ),
                        value: 2,
                        groupValue: radioVal,
                        onChanged: radiochecked,
                        title: Container(
                          decoration: BoxDecoration(
                              color: Colors.purple[100],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          margin: EdgeInsets.fromLTRB(4, 4, 4, 4),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Text(
                                  'Mohamed Salah',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              // floating button of add and the name of client
                              Container(
                                  child: Column(
                                children: [
                                  Text(
                                    'Ahmed Esmat St',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  Text(
                                    'Ain Shams',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                  Text(
                                    '+20118782818',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              )), //Text of address
                            ],
                          ),
                        )),

                    // container bta3 esm el user wel 3enwan
                    Visibility(
                      visible: isChecked(2),
                      child: Container(
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
                      ),
                    )
                  ],
                ),
              ),
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
                  onPressed: () {},
                ),
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
                        Navigator.pushNamed(context, 'address_form');
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
