import 'package:flutter/material.dart';
import 'package:form/form_screen.dart';
import 'Payment.dart';
import 'Review.dart';
import 'delivery_screen.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
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
            children: [DeliveryScreen(), PaymentScreen(), Review()],
          ),
        ));
  }
}
