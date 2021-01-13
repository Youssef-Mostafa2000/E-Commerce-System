import 'package:c_e_commerce/admin/addproduct.dart';
import 'package:c_e_commerce/constants.dart';
import 'package:c_e_commerce/admin/manageproduct.dart';
import 'package:flutter/material.dart';
import 'package:c_e_commerce/admin/vieworders.dart';

class Sellerhome extends StatelessWidget {
  static String id = 'Sellerhome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProduct.id);
            },
            child: Text('Add Product',style: TextStyle(color: Colors.purple,fontSize: 20,fontWeight: FontWeight.bold),),
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red)),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, ManageProducts.id);
            },
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red)),
            child: Text('Edit Product',style: TextStyle(color: Colors.purple,fontSize: 20,fontWeight: FontWeight.bold),),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, OrdersScreen.id);
            },
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red)),
            child: Text('View orders',style: TextStyle(color: Colors.purple,fontSize: 20,fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}
