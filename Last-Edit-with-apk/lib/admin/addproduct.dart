import 'package:flutter/material.dart';
import 'package:c_e_commerce/widgets/mytextfield.dart';
import 'package:c_e_commerce/services/store.dart';
import 'package:c_e_commerce/models/singleproduct.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:c_e_commerce/services/auth.dart';

class AddProduct extends StatefulWidget {
  static String id = 'AddProduct';

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String _name, _price, _description, _category, _imageLocation;
  final _auth = Auth();
  FirebaseUser _loggedUser;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Mytextwidget(
              hint: 'Product Name',
              onClick: (value) {
                setState(() {
                  _name = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Mytextwidget(
              onClick: (value) {
                setState(() {
                  _price = value;
                });
              },
              hint: 'Product Price',
            ),
            SizedBox(
              height: 10,
            ),
            Mytextwidget(
              onClick: (value) {
                setState(() {
                  _description = value;
                });
              },
              hint: 'Product Description',
            ),
            SizedBox(
              height: 10,
            ),
            Mytextwidget(
              onClick: (value) {
                setState(() {
                  _category = value;
                });
              },
              hint: 'Product Category',
            ),
            SizedBox(
              height: 10,
            ),
            Mytextwidget(
              onClick: (value) {
                setState(() {
                  _imageLocation = value;
                });
              },
              hint: 'Product Location',
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                if (_globalKey.currentState.validate()) {
                  _globalKey.currentState.save();

                  _store.addProduct(Product(
                      pName: _name,
                      pPrice: _price,
                      pDescription: _description,
                      pLocation: _imageLocation,
                      pCategory: _category,
                      pseller_email: _loggedUser.email));
                }
              },
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              child: Text('Add Product',style: TextStyle(color: Colors.purple,fontSize: 30,fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    getCurrenUser();
  }

  getCurrenUser() async {
    _loggedUser = await _auth.getUser();
  }
}
