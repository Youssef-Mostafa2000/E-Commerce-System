import 'package:c_e_commerce/models/singleproduct.dart';

class Order {
  String documentId;
  int totallPrice;
  String address;
  List<Product> products;
  Order({this.totallPrice, this.address, this.documentId, this.products});
}
