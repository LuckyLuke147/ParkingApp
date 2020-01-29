import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ParkingDetails extends StatelessWidget {
  final String city;
  final String street;
  final int parkingSpot;
  final String carBrand;
  final String carModel;
  final String registrationNo;

  ParkingDetails(
    this.city,
    this.street,
    this.parkingSpot,
    this.carBrand,
    this.carModel,
    this.registrationNo,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              city + ', ul.' + street,
              style: TextStyle(
                letterSpacing: 0.92,
              ),
            ),
            Text(
              'No. ' + parkingSpot.toString(),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                letterSpacing: 0.92,
              ),
            )
          ],
        ),
        Divider(thickness: 1),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  DateFormat('EEE, MMM d').format(DateTime.now()),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.92,
                  ),
                ),
                Text(
                  DateFormat('h:mm a').format(DateTime.now()),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.92,
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     print('Change');
                //   },
                //   child: Text(
                //     "Change",
                //     style: TextStyle(color: Colors.orange),
                //   ),
                // ),
              ],
            ),
            Text(
              'to',
              style: TextStyle(
                letterSpacing: 0.92,
              ),
            ),
            Column(
              children: <Widget>[
                Text(
                  DateFormat('EEE, MMM d').format(DateTime.now()),
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.92,
                  ),
                ),
                Text(
                  DateFormat('h:mm a').format(DateTime.now()),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.92,
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     print('Change');
                //   },
                //   child: Text(
                //     "Change",
                //     style: TextStyle(color: Colors.orange),
                //   ),
                // ),
              ],
            ),
          ],
        ),
        Divider(thickness: 1),
        Container(
          alignment: FractionalOffset.bottomRight,
          child: Text(
            carBrand + ' ' + carModel + ' : ' + registrationNo,
            style: TextStyle(
              letterSpacing: 0.92,
            ),
          ),
        ),
      ],
    );
  }
}
