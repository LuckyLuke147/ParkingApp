import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/vehicle.dart';
import '../providers/vehicles.dart';
import './drawer_admin_members_details_screen.dart';

class AdminVehiclesScreen extends StatefulWidget {
  static const routeName = '/admin_vehicles';

  @override
  _AdminVehiclesScreenState createState() => _AdminVehiclesScreenState();
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

class _AdminVehiclesScreenState extends State<AdminVehiclesScreen> {
  final List<String> items =
      new List<String>.generate(50, (i) => 'Items ${i + 1}');

  final _debouncer = Debouncer(milliseconds: 500);
  List<String> filteredUsers = List();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      filteredUsers = items;
    });
  }

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
          'Vehicles',
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
                  filteredUsers = items
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
              itemCount: filteredUsers.length,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () => {
                    Navigator.of(context)
                        .pushNamed(MemberDetailsScreen.routeName),
                  },
                  child: Card(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Car_model',
                                style: TextStyle(
                                  fontSize: _width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.92,
                                ),
                              ),
                              Text(
                                'Car_model',
                                style: TextStyle(
                                  fontSize: _width * 0.03,
                                  color: Color.fromRGBO(127, 127, 127, 1),
                                  letterSpacing: 0.92,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Registration No.',
                                style: TextStyle(
                                  fontSize: _width * 0.04,
                                  letterSpacing: 0.92,
                                  color: Color.fromRGBO(127, 127, 127, 1),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Color.fromRGBO(127, 127, 127, 1),
                              ),
                            ],
                          )
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
