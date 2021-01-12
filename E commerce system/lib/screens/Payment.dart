import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:c_e_commerce/widgets/text_field.dart';

import 'checkout.dart';

class PaymentScreen extends StatefulWidget {
  static String id = 'paymentscreen';
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int radiovalue;
  bool x, y;
  int val;
  @override
  void initState() {
    super.initState();
    radiovalue = 0;
    x = true;
    y = false;
    val = 0;
  }

  void radiofunc(val) {
    if (val == 0) {
      x = true;
      y = false;
      print(x);
    } else if (val == 1) {
      x = false;
      y = true;
      print("y");
    } else {
      x = false;
      y = false;
    }
    setState(() {
      radiovalue = val;
    });
  }

  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                        padding: EdgeInsets.fromLTRB(16, 12, 8, 12),
                        child: Text(
                          'SELECT A PAYMENT METHOD',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        child: Column(children: [
                          RadioListTile(
                            value: 0,
                            groupValue: radiovalue,
                            onChanged: radiofunc,
                            activeColor: Colors.purple,
                            title: Text(
                              "PayPal",
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "paypal is the faster,safer way to send money,make an online payment ,receive money",
                              style: TextStyle(fontSize: 18),
                            ),
                            secondary: Image.asset("images/payment/11.png"),
                          ),
                          Visibility(
                            child: Container(
                              child: text(),
                            ),
                            visible: x,
                          ),
                          RadioListTile(
                            value: 1,
                            groupValue: radiovalue,
                            onChanged: radiofunc,
                            activeColor: Colors.purple,
                            title: Text(
                              "Credit Card",
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Safe money transfer with your bank account",
                              style: TextStyle(fontSize: 18),
                            ),
                            secondary: Image.asset("images/payment/22.png"),
                          ),
                          Visibility(
                            child: Container(
                              child: text(),
                            ),
                            visible: y,
                          ),
                          RadioListTile(
                            value: 2,
                            groupValue: radiovalue,
                            onChanged: radiofunc,
                            activeColor: Colors.purple,
                            title: Text(
                              "Cash ",
                              style: TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Pay by Cash money when receive the order",
                              style: TextStyle(fontSize: 18),
                            ),
                            secondary: Image.asset("images/payment/33.png"),
                          ),
                        ]),
                      ), //container bta3 el radio buttoms
                    ],
                  ),
                ),
              ), //container el radio buttoms bta3 el payment method
              /*Container(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.purple,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red)),
                  highlightColor: Colors.white,
                  child: Text(
                    "Proceed To Review Page ",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ), */ // container bta3 el raised buttom
            ],
          ),
        ),
      ),
    );
  }
}
