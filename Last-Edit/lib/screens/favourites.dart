import 'package:c_e_commerce/providers/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:c_e_commerce/components/favourite_component.dart';
import 'package:c_e_commerce/models/singleproduct.dart';
import 'package:c_e_commerce/services/store.dart';
import 'package:c_e_commerce/constants.dart';
import 'package:c_e_commerce/providers/cart_item.dart';
import 'package:provider/provider.dart';
import 'package:c_e_commerce/providers/cart_item.dart';

class Favourite extends StatefulWidget {
  static String id = 'favouritescreen';

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<Favouriteitem>(context).products;
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.1,
        title: new Text('Favourites'),
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
      body: Favourite_products(),
    );
  }
}
