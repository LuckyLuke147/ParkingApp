import 'package:flutter/material.dart';

class ProfilePasswordFields extends StatelessWidget {
  final double size;
  final String title;
  final String hint;

  ProfilePasswordFields(
    this.size,
    this.title,
    this.hint,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: size * 0.04,
            letterSpacing: 0.92,
            color: Color.fromRGBO(127, 127, 127, 1),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: TextField(
              obscureText: true,
              style: TextStyle(
                fontSize: size * 0.04,
                letterSpacing: 0.92,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: size * 0.04,
                  letterSpacing: 0.92,
                  color: Colors.black26,
                ),
                border: InputBorder.none,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ),
      ],
    );
  }
}
