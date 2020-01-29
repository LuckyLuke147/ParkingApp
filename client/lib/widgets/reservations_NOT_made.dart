import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/drawer_admin_members_details_screen.dart';

class MadeNotReservations extends StatefulWidget {
  @override
  _MadeNotReservationsState createState() => _MadeNotReservationsState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _MadeNotReservationsState extends State<MadeNotReservations> {
  final List<String> items =
      new List<String>.generate(50, (i) => 'Items ${i + 1}');

  final _debouncer = Debouncer(milliseconds: 500);

  List<String> filteredReservations = List();

  @override
  void initState() {
    super.initState();
    setState(() {
      filteredReservations = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        TextField(
          style: TextStyle(
            letterSpacing: 0.92,
          ),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
            ),
            prefixIcon: Icon(Icons.search, color: Colors.orange),
            contentPadding: EdgeInsets.only(top: 15),
            hintText: 'Search',
          ),
          onChanged: (string) {
            _debouncer.run(() {
              setState(() {
                filteredReservations = items
                    .where(
                        (u) => (u.toLowerCase().contains(string.toLowerCase())))
                    .toList();
              });
            });
          },
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            itemCount: filteredReservations.length,
            itemBuilder: (ctx, index) {
              return index % 3 == 0
                  ? Container(
                      padding: EdgeInsets.all(10.0),
                      color: Colors.orange[300],
                      child: Text(
                        DateFormat('dd/MM/yyyy').format(DateTime.now()),
                        style: TextStyle(
                          fontSize: _width * 0.04,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.92,
                        ),
                      ),
                    )
                  : ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      dense: true,
                      title: Text(
                        DateFormat('h:mm a').format(DateTime.now()) +
                            ' - ' +
                            DateFormat('h:mm a').format(DateTime.now()),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: _width * 0.035,
                          letterSpacing: 0.92,
                        ),
                      ),
                      subtitle: Text(
                        'Name' + ' ' + 'Surname' + '\n' + 'Registration No.',
                        style: TextStyle(
                          fontSize: _width * 0.03,
                          letterSpacing: 0.92,
                        ),
                      ),
                      isThreeLine: true,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'No. ' + 20.toString(),
                            style: TextStyle(
                              fontSize: _width * 0.06,
                              letterSpacing: 0.92,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(127, 127, 127, 1),
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                      onTap: () => {
                        Navigator.of(context)
                            .pushNamed(MemberDetailsScreen.routeName),
                      },
                    );
            },
          ),
        ),
      ],
    );
  }
}
