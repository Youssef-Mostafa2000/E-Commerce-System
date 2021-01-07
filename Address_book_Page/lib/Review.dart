import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Review extends StatefulWidget {
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  bool promoflag=false;
  int i=0;
  void promo(){
    setState(() {
      if(i==0){
        promoflag=true;
        i=1;
      }
      else if(i==1)
      {
        promoflag=false;
        i=0;
      }
    });
  }

  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar(
            title: Text(
              "Review ",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            backgroundColor: Colors.purple,
          ),
          body: SingleChildScrollView(
            child: Container(
              //height: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order Summary",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "3 Items",
                            style: TextStyle(fontSize: 25, color: Colors.grey),
                            textAlign: TextAlign.end,
                          )
                        ],
                      ),
                    ), //container bta3 el order summary wel no. of items
                    Container(
                      color: Colors.white24,
                      margin: EdgeInsets.fromLTRB(24, 12, 24, 12),
                      width: double.infinity,
                      //height: 200,
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
                      margin: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ship and Bill to",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ), //container bta3 el ship and bill to
                    Container(
                      color: Colors.white24,
                      margin: EdgeInsets.fromLTRB(24, 12, 24, 12),
                      width: double.infinity,
                      //height: 200,
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Card(
                              margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              color: Colors.deepPurpleAccent,
                              child: Text(
                                "The Address From Data Base",
                                style: TextStyle(fontSize: 25,color: Colors.white),
                              ),

                            ),
                          ],
                        ),
                      ),
                    ), //container bta3 el address
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          children: [
                            FlatButton(
                              onPressed: promo,
                              child: Text("Having a Promo Code",style: TextStyle(fontSize: 25,color: Colors.purple,fontWeight: FontWeight.bold),),
                            ),
                            Visibility(
                              visible: promoflag,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                child: TextField(
                                  decoration: InputDecoration(
                                      labelText: "Enter the Promo Code",
                                      labelStyle: TextStyle(fontSize: 20)
                                  ),
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
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ), // container el totalhead
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.fromLTRB(30, 2, 30, 2),
                      width: double.infinity,
                      //height: 200,
                      child: Container(
                        color: Colors.white,
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
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Subtotal',style: TextStyle(fontSize: 20,color: CupertinoColors.black,fontWeight: FontWeight.bold),),
                                        Text('\$505.50',style: TextStyle(fontSize: 20,color: CupertinoColors.black,fontWeight: FontWeight.bold),)

                                      ],
                                    ),
                                  ), // row of subtotal
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Taxes',style: TextStyle(fontSize: 20,color: CupertinoColors.black,fontWeight: FontWeight.bold),),
                                        Text('\$0.0',style: TextStyle(fontSize: 20,color: CupertinoColors.black,fontWeight: FontWeight.bold),)

                                      ],
                                    ),
                                  ),   // row of taxes
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Shipping',style: TextStyle(fontSize: 20,color: CupertinoColors.black,fontWeight: FontWeight.bold)),
                                        Text('Free',style: TextStyle(fontSize: 20,color: CupertinoColors.black,fontWeight: FontWeight.bold),)

                                      ],
                                    ),
                                  ),  // row of shipping
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Total',style: TextStyle(fontSize: 20,color: CupertinoColors.black,fontWeight: FontWeight.bold),),
                                        Text('\$505.50',style: TextStyle(fontSize: 20,color: CupertinoColors.black,fontWeight: FontWeight.bold),)

                                      ],
                                    ),
                                  ),   // row of total




                                ],
                              ),

                            ),
                          ],
                        ),
                      ),
                    ), //container el toral with money
                    Container(
                      child: RaisedButton(
                        onPressed: (){},
                        color: Colors.purple,
                        child: Text("Order Now",style: TextStyle(fontSize: 35,color: Colors.black),),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),
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
