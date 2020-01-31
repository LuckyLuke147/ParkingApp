import 'package:flutter/material.dart';

import '../screens/drawer_profile_screen.dart';
import '../screens/drawer_user_reservations_screen.dart';
import '../screens/drawer_user_vehicles_screen.dart';
import '../screens/signIn_screen.dart';

class UserAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Icon(
                Icons.account_circle,
                size: 80,
                color: Colors.white,
              ),
            ),
            accountName: Text(
              'Name & Surname',
              style: TextStyle(
                fontSize: _width * 0.048,
                letterSpacing: 0.92,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              'mail@gmail.com',
              style: TextStyle(
                fontSize: _width * 0.035,
                letterSpacing: 0.92,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.perm_identity),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: _width * 0.04,
                letterSpacing: 0.92,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(ProfileScreen.routeName);
            },
          ),
          Divider(thickness: 0.5),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text(
              'Reservations',
              style: TextStyle(
                fontSize: _width * 0.04,
                letterSpacing: 0.92,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(ReservationScreen.routeName);
            },
          ),
          Divider(thickness: 0.5),
          ListTile(
            leading: Icon(Icons.directions_car),
            title: Text(
              'Vehicles',
              style: TextStyle(
                fontSize: _width * 0.04,
                letterSpacing: 0.92,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(VehiclesScreen.routeName);
            },
          ),
          Divider(thickness: 0.5),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: _width * 0.04,
                letterSpacing: 0.92,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(SignInScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
