import 'dart:core';
import 'package:flutter/material.dart';

String holder_name = "";
String card_number = "";
String exp_date = "";
String cvv = "";

class CreditCardDetails extends StatefulWidget {
  @override
  _CreditCardDetailsState createState() => _CreditCardDetailsState();
}

class _CreditCardDetailsState extends State<CreditCardDetails> {
  GlobalKey<FormState> _cardformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        child: Form(
          key: _cardformKey,
          child: Column(
            children: [
              Image.asset('img/visa.png'),
              _buildholderName(),
              _buildcardNumber(),
              _buildcardDetails(),
              SizedBox(
                height: 100,
              ),
              Container(
                  color: Colors.white70,
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(12, 4, 12, 4),
                  child: Container(
                      width: 400,
                      height: 50,
                      color: Colors.purple,
                      child: RaisedButton(
                        color: Colors.purple,
                        onPressed: null,
                        child: Text(
                          "CONFIRM",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ))),
            ],
          ),
        ),
      )),
      appBar: AppBar(
        title: Text("Credit Card Details"),
        backgroundColor: Colors.purple,
        shadowColor: Colors.grey,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => null,
        ),
      ),
    );
  }
}

Widget _buildholderName() {
  return Container(
    padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
    child: TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
            ),
          ),
          labelText: 'Card holder name',
          labelStyle: TextStyle(fontSize: 25),
          hintText: 'Enter card holder name',
          hintStyle: TextStyle(fontSize: 20),
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0)),
      keyboardType: TextInputType.name,
      onSaved: (newValue) {
        holder_name = newValue;
      },
    ),
  );
}

Widget _buildcardNumber() {
  return Container(
    padding: EdgeInsets.fromLTRB(12, 12, 12, 20),
    child: TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
          labelText: 'Card number',
          labelStyle: TextStyle(fontSize: 25),
          hintText: 'Enter your card number',
          hintStyle: TextStyle(fontSize: 20),
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.fromLTRB(10, 10, 0, 0)),
      keyboardType: TextInputType.number,
      onSaved: (newValue) {
        card_number = newValue;
      },
    ),
  );
}

Widget _buildcardDetails() {
  return Row(
    children: [
      Container(
        height: 100,
        width: 200,
        padding: EdgeInsets.fromLTRB(50, 12, 12, 20),
        child: TextFormField(
          decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
              labelText: 'Exp. Date',
              labelStyle: TextStyle(fontSize: 25),
              hintText: 'MM/YY',
              hintStyle: TextStyle(fontSize: 20),
              alignLabelWithHint: true,
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
          keyboardType: TextInputType.number,
          onSaved: (newValue) {
            exp_date = newValue;
          },
        ),
      ),
      Container(
        height: 100,
        width: 170,
        padding: EdgeInsets.fromLTRB(40, 12, 0, 20),
        child: TextFormField(
          maxLength: 3,
          decoration: InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
              labelText: 'CVV',
              labelStyle: TextStyle(fontSize: 25),
              hintText: '123',
              hintStyle: TextStyle(fontSize: 20),
              alignLabelWithHint: true,
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
          keyboardType: TextInputType.number,
          onSaved: (newValue) {
            cvv = newValue;
          },
        ),
      )
    ],
  );
}
