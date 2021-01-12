import 'package:flutter/material.dart';
import 'package:c_e_commerce/constants.dart';

class Mytextwidget extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function onClick;
  final key;

  Mytextwidget(
      {@required this.onClick,
      @required this.hint,
      @required this.icon,
      @required this.key});
  String error_message(String hint_type) {
    if (hint == 'Enter your name here') {
      return 'name is empty!';
    }
    if (hint == 'Enter your email here') {
      return 'email is empty!';
    }
    if (hint == 'Enter your password here') {
      return 'password is empty!';
    }
    if (hint == 'Seller or User') {
      return 'Account type in empty!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: TextFormField(
        key: key,
        validator: (value) {
          if (value.isEmpty) {
            return error_message(hint);
          }
        },
        onSaved: onClick,
        obscureText: hint == 'Enter your password here' ? true : false,
        cursorColor: cmaincolor,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: cmaincolor,
          ),
          hintText: hint,
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
