import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/member_details_fields.dart';

class DisablePlaceScreen extends StatelessWidget {
  static const routeName = '/disable_place';

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'No. 2',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            letterSpacing: 0.92,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MemberDetails(_width, 'Name', 'Name'),
            Divider(),
            MemberDetails(_width, 'Surname', 'Surname'),
            Divider(),
            MemberDetails(_width, 'Phone number', 1234567.toString()),
            SizedBox(height: _height * 0.09),
            MemberDetails(_width, 'Registration No.', 'KR 12345'),
            Divider(),
            MemberDetails(_width, 'Hours', '08:00 - 17:00'),
            Divider(),
            MemberDetails(_width, 'Date',
                DateFormat('dd/MM/yyyy').format(DateTime.now())),
            Divider(),
            SizedBox(height: 10),
            ButtonTheme(
              minWidth: _width,
              height: 50,
              child: RaisedButton(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.clear,
                      color: Colors.red,
                    ),
                    VerticalDivider(width: 8),
                    Text(
                      'Delete booking',
                      style: TextStyle(
                        fontSize: _width * 0.04,
                        letterSpacing: 0.92,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  return showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text(
                        'Delete Alert',
                        style: TextStyle(
                          letterSpacing: 0.92,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      content: Text(
                        'Are you sure you want to delete this booking?',
                        style: TextStyle(
                          letterSpacing: 0.92,
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            'No',
                            style: TextStyle(
                              letterSpacing: 0.92,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(ctx).pop(false);
                          },
                        ),
                        Container(
                          height: 30,
                          child: VerticalDivider(),
                        ),
                        FlatButton(
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              letterSpacing: 0.92,
                              color: Colors.red,
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(ctx).pop(true);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
