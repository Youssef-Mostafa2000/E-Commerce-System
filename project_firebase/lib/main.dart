import 'package:flutter/material.dart';
import 'package:project_firebase/dashboard.dart';
import 'package:project_firebase/login.dart';
import 'signup.dart';
import 'login.dart';
import 'dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
      routes: {
        'signup': (context) => SignUpScreen(),
        'login': (context) => LoginScreen(),
        'dashboard': (context) => DashboardScreen()
      },
    );
  }
}
