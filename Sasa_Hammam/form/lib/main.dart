import 'package:flutter/material.dart';
import 'package:form/checkout.dart';
import 'package:form/form_screen.dart';
import 'credit_card_details.dart';
import 'Addressbook.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        'checkout': (context) => CheckoutScreen(selectedAddress),
        'address_book': (context) => Addressproject(),
      },
      initialRoute: 'checkout',
    );
  }
}
