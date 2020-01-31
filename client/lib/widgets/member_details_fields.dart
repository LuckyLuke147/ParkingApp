import 'package:flutter/material.dart';

class MemberDetails extends StatelessWidget {
  final double _width;
  final String text;
  final String text_detail;

  const MemberDetails(
    this._width,
    this.text,
    this.text_detail,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _width * 0.04,
              letterSpacing: 0.92,
              color: Color.fromRGBO(127, 127, 127, 1),
            ),
          ),
          Text(
            text_detail,
            style: TextStyle(
              fontSize: _width * 0.04,
              letterSpacing: 0.92,
              color: Colors.black,
            ),
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }
}
