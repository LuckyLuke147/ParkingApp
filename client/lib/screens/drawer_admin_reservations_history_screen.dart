import 'package:flutter/material.dart';

import '../widgets/reservations_made.dart';
import '../widgets/reservations_NOT_made.dart';

class ReservationsHistoryScreen extends StatefulWidget {
  static const routeName = '/reservations_history';

  @override
  _ReservationsHistoryScreenState createState() =>
      _ReservationsHistoryScreenState();
}

class _ReservationsHistoryScreenState extends State<ReservationsHistoryScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
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
          'Reservations',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            letterSpacing: 0.92,
          ),
        ),
        backgroundColor: Colors.orange,
        bottom: TabBar(
          controller: controller,
          indicatorColor: Colors.white,
          labelStyle: TextStyle(
            fontSize: _width * 0.04,
            letterSpacing: 0.92,
          ),
          tabs: <Widget>[
            Tab(
              text: 'History',
            ),
            Tab(
              text: 'Booked',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[MadeReservations(), MadeNotReservations()],
      ),
    );
  }
}
