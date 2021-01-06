import 'package:c_e_commerce/models/Complaint.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:c_e_commerce/models/singleproduct.dart';
import 'package:c_e_commerce/constants.dart';
import 'package:c_e_commerce/models/Complaint.dart';

class Store {
  final Firestore _firestore = Firestore.instance;
  addProduct(Product product) {
    _firestore.collection(cProductsCollection).add({
      cProductName: product.pName,
      cProductDescription: product.pDescription,
      cProductLocation: product.pLocation,
      cProductCategory: product.pCategory,
      cProductPrice: product.pPrice,
      cemail: product.pseller_email,
    });
  }

  Future<List<Product>> getProducts() async =>
      _firestore.collection(cProductsCollection).getDocuments().then((result) {
        List<Product> products = [];
        for (DocumentSnapshot product in result.documents) {
          products.add(Product.fromSnapshot(product));
        }
        return products;
      });
  Stream<QuerySnapshot> loadProducts() {
    return _firestore.collection(cProductsCollection).snapshots();
  }

  Stream<QuerySnapshot> loadOrders() {
    return _firestore.collection(cOrders).snapshots();
  }

  Stream<QuerySnapshot> loadOrderDetails(documentId) {
    return _firestore
        .collection(cOrders)
        .document(documentId)
        .collection(cOrderDetails)
        .snapshots();
  }

  deleteProduct(documentId) {
    _firestore.collection(cProductsCollection).document(documentId).delete();
  }

  editProduct(data, documentId) {
    _firestore
        .collection(cProductsCollection)
        .document(documentId)
        .updateData(data);
  }

  storeOrders(data, List<Product> products) {
    var documentRef = _firestore.collection(cOrders).document();
    documentRef.setData(data);
    for (var product in products) {
      documentRef.collection(cOrderDetails).document().setData({
        cProductName: product.pName,
        cProductPrice: product.pPrice,
        cProductQuantity: product.pQuantity,
        cProductLocation: product.pLocation,
        cProductCategory: product.pCategory,
        cProductSize: product.pSize,
        cProductColor: product.pColor,
      });
    }
  }

  storeOrder(data, Product product) {
    var documentRef = _firestore.collection(cOrders).document();
    documentRef.setData(data);

    documentRef.collection(cOrderDetails).document().setData({
      cProductName: product.pName,
      cProductPrice: product.pPrice,
      cProductQuantity: product.pQuantity,
      cProductLocation: product.pLocation,
      cProductCategory: product.pCategory,
      cProductSize: product.pSize,
      cProductColor: product.pColor
    });
  }

  Future<List<Product>> searchProducts({String productName}) {
    // code to convert the first character to uppercase
    String searchKey = productName[0];
    return _firestore
        .collection(cProductsCollection)
        .orderBy("productName")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .getDocuments()
        .then((result) {
          List<Product> products = [];
          for (DocumentSnapshot product in result.documents) {
            products.add(Product.fromSnapshot(product));
          }
          return products;
        });
  }

  addcomplaint(Complaint_model _complaint) {
    _firestore.collection(cComplaintsCollection).add({
      cowner: _complaint.email,
      cphone: _complaint.phone,
      cdescription: _complaint.description,
    });
  }
}
