import 'package:flutter/material.dart';
import 'package:form/checkout.dart';
import 'package:form/form_screen.dart';
import 'credit_card_details.dart';
import 'Addressbook.dart';
import 'Payment.dart';
import 'Review.dart';
import 'text_field.dart';
import 'delivery_screen.dart';

void main() {
  runApp(FormApp());
}

class FormApp extends StatefulWidget {
  @override
  _FormAppState createState() => _FormAppState();
}

class _FormAppState extends State<FormApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormScreen(),
      routes: {
        'address_form': (context) => FormScreen(),
        'credit_card_details': (context) => CreditCardDetails(),
        'checkout': (context) => CheckoutScreen(),
        'address_book': (context) => Addressproject(),
      },
      initialRoute: 'checkout',
    );
  }
}
