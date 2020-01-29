import 'package:flutter/material.dart';

import '../widgets/member_details_fields.dart';

class MemberDetailsScreen extends StatelessWidget {
  static const routeName = '/members_details';

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'Member',
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MemberDetails(_width, 'Name', 'Name'),
            Divider(),
            MemberDetails(_width, 'Surname', 'Surname'),
            Divider(),
            MemberDetails(_width, 'Phone number', 1234567.toString()),
            Divider(),
            MemberDetails(_width, 'Email', 'mail@gmail.com'),
            Divider(),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  itemCount: 5,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      title: Text(
                        'Honda',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _width * 0.04,
                          letterSpacing: 0.92,
                          color: Color.fromRGBO(127, 127, 127, 1),
                        ),
                      ),
                      subtitle: Text(
                        'Accord',
                        style: TextStyle(
                          fontSize: _width * 0.04,
                          letterSpacing: 0.92,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Text(
                        'TNG1166',
                        style: TextStyle(
                          fontSize: _width * 0.04,
                          letterSpacing: 0.92,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }),
            ),
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
                      'Delete member',
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
                        'Are you sure you want to delete this person?',
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
