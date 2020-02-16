import 'package:flutter/material.dart';
import 'package:parking_app/providers/users.dart';
import 'package:provider/provider.dart';

import '../screens/drawer_profile_screen.dart';
import '../screens/drawer_admin_members_screen.dart';
import '../screens/drawer_admin_reservations_screen.dart';
import '../screens/drawer_admin_vehicles_screen.dart';

class AdminAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    var users = Provider.of<Users>(context);
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              '${users.currentUser.name} ${users.currentUser.surname} (Admin)',
              style: TextStyle(
                fontSize: _width * 0.048,
                letterSpacing: 0.92,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            accountEmail: Text(
              '${users.currentUser.email}',
              style: TextStyle(
                fontSize: _width * 0.035,
                letterSpacing: 0.92,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
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
          Divider(),
          ListTile(
            leading: Icon(Icons.supervisor_account),
            title: Text(
              'Members',
              style: TextStyle(
                fontSize: _width * 0.04,
                letterSpacing: 0.92,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(MembersScreen.routeName);
            },
          ),
          Divider(),
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
              Navigator.of(context).pushNamed(AdminReservationScreen.routeName);
            },
          ),
          Divider(),
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
               Navigator.of(context).pushNamed(AdminVehiclesScreen.routeName);
            },
          ),
          Divider(),
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
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
