import 'package:flutter/material.dart';
import 'package:form/form_screen.dart';
import 'credit_card_details.dart';

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
      home: CreditCardDetails(),
    );
  }
}
