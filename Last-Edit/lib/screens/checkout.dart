import 'package:c_e_commerce/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:c_e_commerce/screens/form_screen.dart';
import 'Payment.dart';
import 'Review.dart';
import 'delivery_screen.dart';
import 'Addressbook.dart';
import 'package:c_e_commerce/models/order.dart';

class CheckoutScreen extends StatefulWidget {
  static String id = 'checkoutscreen';
  String _user_id;
  Order _order;

  CheckoutScreen(this._user_id, this._order);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState(_user_id, _order);
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _user_id;
  Order _order;
  int pageNumber;

  _CheckoutScreenState(this._user_id, this._order);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Checkout",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.purple,
            shadowColor: Colors.grey,
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text('DELIVERY'),
                  icon: Icon(Icons.delivery_dining),
                ),
                Tab(
                  child: Text('PAYMENT'),
                  icon: Icon(Icons.payment),
                ),
                Tab(
                  child: Text('SUMMARY'),
                  icon: Icon(Icons.comment),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              DeliveryScreen(_user_id, _order),
              PaymentScreen(),
              Review(order)
            ],
          ),
        ));
  }
}
