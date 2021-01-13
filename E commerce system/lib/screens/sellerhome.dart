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
            child: Text('Add Product'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, ManageProducts.id);
            },
            child: Text('Edit Product'),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.pushNamed(context, OrdersScreen.id);
            },
            child: Text('View orders'),
          )
        ],
      ),
    );
  }
}
