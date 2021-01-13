import 'package:c_e_commerce/components/products.dart';
import 'package:c_e_commerce/screens/Addressbook.dart';
import 'package:c_e_commerce/screens/checkout.dart';
import 'package:c_e_commerce/screens/form_screen.dart';
import 'package:c_e_commerce/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:c_e_commerce/components/cart_componant.dart';
import 'package:c_e_commerce/models/singleproduct.dart';
import 'package:c_e_commerce/services/store.dart';
import 'package:c_e_commerce/constants.dart';
import 'package:c_e_commerce/providers/cart_item.dart';
import 'package:c_e_commerce/models/order.dart';
import 'package:provider/provider.dart';
import 'package:c_e_commerce/providers/cart_item.dart';
import 'package:c_e_commerce/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Cart extends StatefulWidget {
  static String id = 'cartscreen';

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final _auth = Auth();
  FirebaseUser _loggedUser;

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<CartItem>(context).products;
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        title: new Text('Shopping cart'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      body: Cart_products(),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
                child: new ListTile(
              title: new Text("Total:"),
              subtitle: new Text(getTotallPrice(products).toString()),
            )),
            Expanded(
                child: new MaterialButton(
                    child: new Text(
                      "Check out",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.purpleAccent,
                    onPressed: () {
                      showCustomDialog(products, context);
                    })),
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

  void showCustomDialog(List<Product> products, context) async {
    var price = getTotallPrice(products);
    var address;
    AlertDialog alertDialog = AlertDialog(
      actions: <Widget>[
        MaterialButton(
          onPressed: () {
            setState(() {
              try {
                Store _store = Store();
                _store.storeOrders(
                    {cTotallPrice: price, cAddress: address}, products);
                order.totallPrice = price;
                order.products = products;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            CheckoutScreen(selectedAddress, order)));

                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Orderd Successfully'),
                ));
                Navigator.pop(context);
              } catch (ex) {
                print(ex.message);
              }
            });
          },
          child: Text('Confirm'),
        )
      ],
      title: Text('Totall Price  = \$ $price'),
    );
    await showDialog(
        context: context,
        builder: (context) {
          return alertDialog;
        });
  }

  getTotallPrice(List<Product> products) {
    var price = 0;

    for (var product in products) {
      if (product.pQuantity == null) product.pQuantity = 0;
      price += product.pQuantity * int.parse(product.pPrice);
    }
    return price;
  }
}
