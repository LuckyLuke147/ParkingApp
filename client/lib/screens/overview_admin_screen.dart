import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/admin_drop_down_cities.dart';
import '../widgets/drawer_admin_app.dart';

class AdminOverviewScreen extends StatefulWidget {
  static const routeName = '/admin';

  @override
  _AdminOverviewScreenState createState() => _AdminOverviewScreenState();
}

class _AdminOverviewScreenState extends State<AdminOverviewScreen> {
  final GlobalKey _menuKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: Image.asset(
            'assets/logo.png',
            height: 70,
            width: 70,
            alignment: FractionalOffset.center,
          ),
          automaticallyImplyLeading: false,
        ),
      ),
      endDrawer: AdminAppDrawer(),
      body: DropDown(),
    );
  }
}
