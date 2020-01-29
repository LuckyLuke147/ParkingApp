import 'package:flutter/material.dart';

InputDecoration buildSignUpInputDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(
      fontSize: 18.0,
      color: Color.fromRGBO(192, 192, 192, 1),
      letterSpacing: 0.92,
    ),
    filled: true,
    fillColor: Color.fromRGBO(240, 240, 240, 1),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white, width: 0.0),
    ),
    contentPadding: const EdgeInsets.only(
      left: 14.0,
      bottom: 10.0,
      top: 10.0,
    ),
  );
}
