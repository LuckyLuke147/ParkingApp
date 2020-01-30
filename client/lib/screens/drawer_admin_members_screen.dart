import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/users.dart';

import './drawer_admin_members_details_screen.dart';

class MembersScreen extends StatefulWidget {
  static const routeName = '/members';

  @override
  _MembersScreenState createState() => _MembersScreenState();
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

class _MembersScreenState extends State<MembersScreen> {
  final List<String> values = [];
  List<String> filteredUsers = List();

  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    setState(() {
      filteredUsers = values;
    });
  }

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<Users>(context);

    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'Members',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            letterSpacing: 0.92,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Column(
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
                  filteredUsers = values
                      .where((u) =>
                          (u.toLowerCase().contains(string.toLowerCase())))
                      .toList();
                });
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              itemCount: users.items.length,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () => {
                    Navigator.of(context)
                        .pushNamed(MemberDetailsScreen.routeName),
                    FocusScope.of(context).requestFocus(new FocusNode()),
                  },
                  child: Card(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              users.items[index].name +
                                  ' ' +
                                  users.items[index].surname,
                              style: TextStyle(
                                fontSize: _width * 0.04,
                                letterSpacing: 0.92,
                              )),
                          Icon(
                            Icons.arrow_right,
                            color: Color.fromRGBO(127, 127, 127, 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
