import 'package:c_e_commerce/models/singleproduct.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Favouriteitem extends ChangeNotifier {
  List<Product> products = [];

  addProduct(Product product) {
    products.add(product);
    notifyListeners();
  }

  deleteProduct(Product product) {
    products.remove(product);
    notifyListeners();
  }
}
