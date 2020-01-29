import 'package:flutter/material.dart';

import './drawer_admin_reservations_history_screen.dart';

class AdminReservationScreen extends StatefulWidget {
  static const routeName = '/admin_reservations';

  @override
  _AdminReservationScreenState createState() => _AdminReservationScreenState();
}

class _AdminReservationScreenState extends State<AdminReservationScreen> {
  List<String> spinnerItems = ['Kraków', 'Warszawa', 'Gdańsk'];
  String dropdownValue = 'Kraków';

  int _selectedIndex = 0;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'Reservations',
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
          Container(
            alignment: Alignment(1, 1),
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(
                Icons.arrow_drop_down,
                color: Color.fromRGBO(127, 127, 127, 1),
              ),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                color: Color.fromRGBO(127, 127, 127, 1),
                fontSize: 18,
                letterSpacing: 0.92,
              ),
              underline: Container(
                height: 2,
                color: Colors.orange,
              ),
              onChanged: (String data) {
                setState(() {
                  dropdownValue = data;
                });
              },
              items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      letterSpacing: 0.92,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Divider(),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Clear reservations',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _width * 0.04,
                    letterSpacing: 0.92,
                  ),
                ),
                Text(
                  '18:00',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _width * 0.04,
                    letterSpacing: 0.92,
                    color: Color.fromRGBO(127, 127, 127, 1),
                  ),
                ),
              ],
            ),
            onTap: () {
              return showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: Text(
                      'When clear reservations?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.92,
                      ),
                    ),
                    content: Container(
                      padding: EdgeInsets.only(top: 20),
                      height: _height * 0.5,
                      width: _width,
                      child: GestureDetector(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(),
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('17:00'),
                                Icon(Icons.check, color: Colors.orange),
                              ],
                            );
                          },
                        ),
                        onTap: () => print('You tapped'),
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20), child: Divider()),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            title: Text(
              'Reservations',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: _width * 0.04,
                letterSpacing: 0.92,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => {
              Navigator.of(context)
                  .pushNamed(ReservationsHistoryScreen.routeName),
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
