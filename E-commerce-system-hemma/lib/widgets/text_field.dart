import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class text extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 20),
                      hintText: "72515646512",
                      labelText: "Card Number"),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                child: TextField(
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    labelText: "Expired Date",
                    hintText: "MM/YY",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Code",
                    hintText: "66",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 2, 10, 2),
                child: TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Name on the Card",
                    hintText: "Your Name",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
