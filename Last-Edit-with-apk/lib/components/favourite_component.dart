import 'package:c_e_commerce/providers/favourite_item.dart';
import 'package:c_e_commerce/screens/favourites.dart';
import 'package:c_e_commerce/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:c_e_commerce/models/singleproduct.dart';
import 'package:c_e_commerce/constants.dart';
import 'package:provider/provider.dart';
import 'package:c_e_commerce/models/cart_item.dart';
import 'package:c_e_commerce/providers/cart_item.dart';

class Favourite_products extends StatefulWidget {
  @override
  _Favourite_productsState createState() => _Favourite_productsState();
}

class _Favourite_productsState extends State<Favourite_products> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<Favouriteitem>(context).products;
    return new ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return single_favourite_product(
          cart_product_name: products[index].pName,
          cart_product_color: products[index].pDescription,
          cart_product_quantity: products[index].pPrice,
          cart_product_size: products[index].pDescription,
          cart_product_price: products[index].pPrice,
          cart_product_pic: products[index].pLocation,
        );
      },
    );
  }
}

class single_favourite_product extends StatelessWidget {
  final cart_product_name;
  final cart_product_pic;
  final cart_product_size;
  final cart_product_color;
  final cart_product_price;
  final cart_product_quantity;

  const single_favourite_product(
      {Key key,
      this.cart_product_name,
      this.cart_product_pic,
      this.cart_product_size,
      this.cart_product_color,
      this.cart_product_quantity,
      this.cart_product_price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<Favouriteitem>(context).products;
    Product _product;
    return Container(
      margin: EdgeInsets.fromLTRB(8, 8, 8, 12),
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
          color: Colors.purple[100],
          borderRadius:
          BorderRadius.all(Radius.circular(8))),
      child: ListTile(
        ////leading picccccc
        ///
        onTap: () {
          // Navigator.pushNamed(context, ProductDetails.id, arguments:_product(pName:cart_product_name,));
        },
        leading: new Image.network(
          cart_product_pic,
          width: 80,
          height: 80,
        ),
        // title nameeeeeeeeee
        title: new Text(cart_product_name),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[],
            ),
            // priceeeeeeeeeeeeeeeee
            new Container(
              alignment: Alignment.topLeft,
              child: new Text(
                'Price:$cart_product_price',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.purpleAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
