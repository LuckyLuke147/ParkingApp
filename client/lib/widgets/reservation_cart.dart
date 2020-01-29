import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReservationItem extends StatefulWidget {
  @override
  _ReservationItemState createState() => _ReservationItemState();
}

class _ReservationItemState extends State<ReservationItem> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: _expanded ? 120 : 80,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: ListView(
          primary: false,
          children: <Widget>[
            ListTile(
              // contentPadding: EdgeInsets.all(5),
              dense: true,
              enabled: false,
              title: Text(
                'No. 20',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.92,
                ),
              ),
              subtitle: Text(
                DateFormat('dd/MM/yyyy').format(DateTime.now()) + '\nKraków',
                style: TextStyle(
                  letterSpacing: 0.92,
                ),
              ),
              isThreeLine: true,
              trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            if (_expanded)
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(horizontal: 15),
                //height: 50,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          DateFormat('h:mm a - h:mm a').format(DateTime.now()),
                          style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 0.92,
                          ),
                        ),
                        Text(
                          'Honda Accord\nKR12345',
                          style: TextStyle(
                            color: Colors.grey,
                            letterSpacing: 0.92,
                          ),
                          textAlign: TextAlign.end,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
