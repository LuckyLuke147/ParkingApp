import 'package:flutter/material.dart';

class NewVehicle extends StatelessWidget {
  String text;

  NewVehicle(this.text);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Colors.black,
        letterSpacing: 0.92,
      ),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
        hintText: text,
        hintStyle: TextStyle(
          color: Colors.black54,
          letterSpacing: 0.92,
        ),
      ),
      textAlign: TextAlign.end,
    );
  }
}
