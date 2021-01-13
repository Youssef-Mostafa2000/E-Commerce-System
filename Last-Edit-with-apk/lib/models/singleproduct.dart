import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String pName;
  String pPrice;
  String pLocation;
  String pDescription;
  String pCategory;
  String pId;
  int pQuantity;
  int pSize;
  String pColor;
  String pseller_email;
  Product(
      {this.pQuantity,
      this.pSize,
      this.pColor,
      this.pId,
      this.pName,
      this.pCategory,
      this.pDescription,
      this.pLocation,
      this.pPrice,
      this.pseller_email});
  Product.fromSnapshot(DocumentSnapshot snapshot) {
    pName = snapshot.data[pName];
    pSize = snapshot.data[pSize];
    pColor = snapshot.data[pColor];
    pCategory = snapshot.data[pCategory];
    pId = snapshot.data[pId];
    pDescription = snapshot.data[pDescription];
    pLocation = snapshot.data[pLocation];
    pPrice = snapshot.data[pPrice];
  }
}
