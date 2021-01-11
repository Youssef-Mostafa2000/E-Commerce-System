import 'package:flutter/material.dart';
import 'package:form/form_screen.dart';
import 'Payment.dart';
import 'Review.dart';
import 'delivery_screen.dart';
import 'Addressbook.dart';

class CheckoutScreen extends StatefulWidget {
  String _user_id;
  CheckoutScreen(this._user_id);
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState(_user_id);
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _user_id;
  int pageNumber;
  _CheckoutScreenState(this._user_id);
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
            children: [DeliveryScreen(_user_id), PaymentScreen(), Review()],
          ),
        ));
  }
}
