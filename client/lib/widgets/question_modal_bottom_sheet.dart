import 'package:flutter/material.dart';

class QuestionModalBootomSheet extends StatelessWidget {
  final double _width;
  final double _height;
  final String question;

  QuestionModalBootomSheet(
    this._width,
    this._height,
    this.question,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 30),
      color: Colors.white,
      width: _width,
      child: Text(
        question,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: _height * 0.020,
          color: Color.fromRGBO(178, 178, 178, 1),
          letterSpacing: 0.92,
        ),
      ),
    );
  }
}
