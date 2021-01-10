import 'package:c_e_commerce/admin/addproduct.dart';
import 'package:c_e_commerce/admin/editproduct.dart';
import 'package:c_e_commerce/admin/vieworders.dart';
import 'package:c_e_commerce/providers/favourite_item.dart';
import 'package:c_e_commerce/admin/manageproduct.dart';
import 'package:c_e_commerce/screens/complaints.dart';
import 'package:c_e_commerce/screens/sellerhome.dart';
import 'package:c_e_commerce/screens/homepage.dart';
import 'package:c_e_commerce/screens/login_screen.dart';
import 'package:c_e_commerce/screens/orderdetails.dart';
import 'package:c_e_commerce/screens/product_search.dart';
import 'package:c_e_commerce/screens/sellerhome.dart';
import 'package:c_e_commerce/screens/signup_screen.dart';
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
        },
      ),
    );
  }
}
