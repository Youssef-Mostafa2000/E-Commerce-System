import 'package:flutter/material.dart';
import 'package:c_e_commerce/components/cart_componant.dart';
import 'package:c_e_commerce/models/singleproduct.dart';
import 'package:c_e_commerce/services/store.dart';
import 'package:c_e_commerce/constants.dart';
import 'package:c_e_commerce/providers/cart_item.dart';
import 'package:provider/provider.dart';
import 'package:c_e_commerce/providers/cart_item.dart';

class Cart extends StatefulWidget {
  static String id = 'cartscreen';
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
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

  void showCustomDialog(List<Product> products, context) async {
    var price = getTotallPrice(products);
    var address;
    AlertDialog alertDialog = AlertDialog(
      actions: <Widget>[
        MaterialButton(
          onPressed: () {
            try {
              Store _store = Store();
              _store.storeOrders(
                  {cTotallPrice: price, cAddress: address}, products);

              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text('Orderd Successfully'),
              ));
              Navigator.pop(context);
            } catch (ex) {
              print(ex.message);
            }
          },
          child: Text('Confirm'),
        )
      ],
      content: TextField(
        onChanged: (value) {
          address = value;
        },
        decoration: InputDecoration(hintText: 'Enter your Address'),
      ),
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
