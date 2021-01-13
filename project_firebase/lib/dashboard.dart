import 'package:flutter/material.dart';
import 'package:project_firebase/dashboard.dart';
import 'package:project_firebase/login.dart';
import 'signup.dart';
import 'login.dart';
import 'dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [Container(), Container(), Container(), Container()],
          ),
        ),
      ),
    );
  }
}
