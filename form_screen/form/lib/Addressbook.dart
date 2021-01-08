import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class Addressproject extends StatefulWidget {
  _AddressprojectState createState() => _AddressprojectState();
}

class _AddressprojectState extends State<Addressproject> {
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
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.purple[100],
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    margin: EdgeInsets.fromLTRB(8, 8, 8, 4),
                    padding: EdgeInsets.fromLTRB(4, 4, 4, 4),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                                child: Text(
                                  'Youssef Mostafa',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              FlatButton(
                                child: Text(
                                  'Edit',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.purple),
                                ),
                                onPressed: () {
                                  //Navigator.pushNamed(context, 'address_form');
                                },
                              ),
                            ],
                          ),
                        ), // floating button of add and the name of client
                        Padding(
                            padding: EdgeInsets.only(right: 80),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Gamal Abd El-Nasser',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black),
                                ),
                                Text(
                                  'Al Salam City',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black),
                                ),
                                Text(
                                  '+201112367131',
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black),
                                ),
                              ],
                            )), //Text of address
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.purple,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'This is your Defult Address',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ), // defult address
                      ],
                    ),
                  ), // container bta3 esm el user wel 3enwan
                  Container(
                    margin: EdgeInsets.only(top: 3),
                    alignment: Alignment.center,
                    color: Colors.white,
                    height: 50,
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
                  ), // container bta3 select address
                ],
              ),
            ),

            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 10),
              alignment: Alignment.center,
              height: 50,
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
    );
  }
}
