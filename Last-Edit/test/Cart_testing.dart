import 'package:c_e_commerce/models/cart_item.dart';
import 'package:c_e_commerce/services/store.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:c_e_commerce/models/singleproduct.dart';
import 'package:c_e_commerce/widgets/dependency_assembler.dart';
import 'package:c_e_commerce/providers/cart_item.dart';

List<Product> mockProducts = [
  Product(
      pQuantity: 1, pName: "Product1", pPrice: '111', pLocation: "imageUrl"),
  Product(
      pQuantity: 2, pName: "Product2", pPrice: '222', pLocation: "imageUrl"),
  Product(
      pQuantity: 3, pName: "Product3", pPrice: '333', pLocation: "imageUrl"),
  Product(
      pQuantity: 4, pName: "Product4", pPrice: '444', pLocation: "imageUrl"),
];

void main() {
  setupDependencyAssembler();

  var cartViewModel = dependencyAssembler<CartItem>();

  cartViewModel.addProduct(mockProducts[0]);
  cartViewModel.addProduct(mockProducts[1]);
  cartViewModel.addProduct(mockProducts[2]);
  cartViewModel.addProduct(mockProducts[3]);
  cartViewModel.addProduct(mockProducts[0]);
  cartViewModel.addProduct(mockProducts[1]);

  group('Given Cart Page Loads', () {
    test('Page should load list of products added to cart', () async {
      expect(cartViewModel.products.length, 6);
    });

    test('Page should check products in cart and show accurate summary data',
        () {
      //getCartSummary();
      expect(cartViewModel.products[0].pQuantity, 1);
      expect(cartViewModel.products[1].pQuantity, 2);
      expect(cartViewModel.products[2].pQuantity, 3);
      expect(cartViewModel.products[3].pQuantity, 4);
      expect(cartViewModel.products[0].pName, "Product1");
      expect(cartViewModel.products[1].pName, "Product2");
      expect(cartViewModel.products[2].pName, "Product3");
      expect(cartViewModel.products[3].pName, "Product4");
      expect(cartViewModel.products[0].pPrice, "111");
      expect(cartViewModel.products[1].pPrice, "222");
      expect(cartViewModel.products[2].pPrice, "333");
      expect(cartViewModel.products[3].pPrice, "444");
    });
  });
}
