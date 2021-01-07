import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
//import 'package:app03/main.dart';



class Addressproject extends StatefulWidget {
  _AddressprojectState createState() => _AddressprojectState();
}

class _AddressprojectState extends State<Addressproject> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
          color: Colors.blueGrey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Text(
                                  'Youssef Mostafa',
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                FlatButton(
                                  padding: EdgeInsets.fromLTRB(70, 10, 10, 10),
                                  child: Text(
                                    'Edit',
                                    style:
                                    TextStyle(fontSize: 25, color: Colors.purple),
                                  ),
                                  onPressed: () {},
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
                                    style:
                                    TextStyle(fontSize: 25, color: Colors.grey),
                                  ),
                                  Text(
                                    'Al Salam City',
                                    style:
                                    TextStyle(fontSize: 25, color: Colors.grey),
                                  ),
                                  Text(
                                    '+201112367131',
                                    style:
                                    TextStyle(fontSize: 25, color: Colors.grey),
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
                                    'this is your defult address',
                                    style:
                                    TextStyle(fontSize: 20, color: Colors.grey),
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
                      child: FlatButton(
                        child: Text(
                          'SELECT THIS ADDRESS',
                          style: TextStyle(fontSize: 25, color: Colors.purple),
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
                    Icon(
                      Icons.add_circle,
                      color: Colors.purple,
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Add New Address',
                        style: TextStyle(fontSize: 25, color: Colors.purple),
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
