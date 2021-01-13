import 'package:c_e_commerce/admin/addproduct.dart';
import 'package:c_e_commerce/admin/editproduct.dart';
import 'package:c_e_commerce/admin/vieworders.dart';
import 'package:c_e_commerce/models/order.dart';
import 'package:c_e_commerce/providers/favourite_item.dart';
import 'package:c_e_commerce/admin/manageproduct.dart';
import 'package:c_e_commerce/screens/Addressbook.dart';
import 'package:c_e_commerce/screens/Clothes_page.dart';
import 'package:c_e_commerce/screens/Laptops_page.dart';
import 'package:c_e_commerce/screens/Mobiles_page.dart';
import 'package:c_e_commerce/screens/Review.dart';
import 'package:c_e_commerce/screens/checkout.dart';
import 'package:c_e_commerce/screens/complaints.dart';
import 'package:c_e_commerce/screens/credit_card_details.dart';
import 'package:c_e_commerce/screens/delivery_screen.dart';
import 'package:c_e_commerce/screens/form_screen.dart';
import 'package:c_e_commerce/screens/sellerhome.dart';
import 'package:c_e_commerce/screens/homepage.dart';
import 'package:c_e_commerce/screens/login_screen.dart';
import 'package:c_e_commerce/screens/orderdetails.dart';
import 'package:c_e_commerce/screens/product_search.dart';
import 'package:c_e_commerce/screens/sellerhome.dart';
import 'package:c_e_commerce/screens/signup_screen.dart';
import 'package:c_e_commerce/screens/checkout.dart';

import 'package:c_e_commerce/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:c_e_commerce/providers/cart_item.dart';
import 'package:c_e_commerce/screens/product_details.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CartItem>(
          create: (context) => CartItem(),
        ),
        ChangeNotifierProvider<Favouriteitem>(
          create: (context) => Favouriteitem(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: loginscreen.id,
        routes: {
          loginscreen.id: (context) => loginscreen(),
          signupscreen.id: (context) => signupscreen(),
          HomePage.id: (context) => HomePage(),
          Sellerhome.id: (context) => Sellerhome(),
          AddProduct.id: (context) => AddProduct(),
          OrderDetails.id: (context) => OrderDetails(),
          OrdersScreen.id: (context) => OrdersScreen(),
          Cart.id: (context) => Cart(),
          ProductDetails.id: (context) => ProductDetails(),
          ProductSearchScreen.id: (context) => ProductSearchScreen(),
          ManageProducts.id: (context) => ManageProducts(),
          EditProduct.id: (context) => EditProduct(),
          Complaint.id: (context) => Complaint(),
          Mobiles.id: (context) => Mobiles(),
          clothes.id: (context) => clothes(),
          Laptop.id: (context) => Laptop(),
          Review.id: (context) => Review(Order()),
          Addressproject.id: (context) => Addressproject(),
          //CheckoutScreen.id: (context) => CheckoutScreen(),
          Laptop.id: (context) => Laptop(),
          CreditCardDetails.id: (context) => CreditCardDetails(),
          //DeliveryScreen.id: (context) => DeliveryScreen(),
          FormScreen.id: (context) => FormScreen(),
          'address_form': (context) => FormScreen(),
          'credit_card_details': (context) => CreditCardDetails(),
          'checkout': (context) => CheckoutScreen(selectedAddress, Order()),
          'address_book': (context) => Addressproject(),
        },
      ),
    );
  }
}
//Hemma