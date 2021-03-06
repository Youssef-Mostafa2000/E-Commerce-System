import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'text_field.dart';




class Payment extends StatefulWidget {
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int radiovalue ;
  bool x,y;
  int val;
  @override
  void initState() {
    super.initState();
    radiovalue = 1;
    x=true;
    y=false;
    val=0;
  }


  void radiofunc( val) {
    if(val==0)
    {
      x=true;
      y=false;
      print(x);
    }
    else if(val==1){
      x=false;
      y=true;
      print("y");
    }
    else{
      x=false;
      y=false;
    }
    setState(() {
      radiovalue = val;

    });
  }



  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(
            "Payment ",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.purple,
        ),
        body: SingleChildScrollView(
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
                                style: TextStyle(fontSize: 15),
                              ),
                              secondary:Image.asset("image/11.png"),
                            ),
                            Visibility(
                              child: Container(child: text(),),
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
                                style: TextStyle(fontSize: 15),
                              ),
                              secondary: Image.asset("image/22.png"),
                            ),
                            Visibility(
                              child: Container(child: text(),),
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
                                style: TextStyle(fontSize: 15),
                              ),
                              secondary: Image.asset("image/33.png"),
                            ),
                          ]),
                        ), //container bta3 el radio buttoms
                      ],
                    ),
                  ),
                ), //container el radio buttoms bta3 el payment method
                Container(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.purple,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.red)
                    ),
                    highlightColor: Colors.white,
                    child: Text(
                      "Proceed To Review Page ",
                      style: TextStyle(fontSize: 25, color: Colors.white),

                    ),
                  ),
                ), // container bta3 el raised buttom
              ],
            ),
          ),
        ),
      );

  }
}
