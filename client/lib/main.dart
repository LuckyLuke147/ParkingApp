import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parking_app/widgets/drawer_admin_app.dart';
import 'package:provider/provider.dart';

import './providers/users.dart';

import './screens/signIn_screen.dart';
import './screens/signUp_screen.dart';
import './screens/overview_user_screen.dart';
import './screens/drawer_profile_screen.dart';
import './screens/drawer_user_reservations_screen.dart';
import './screens/overview_admin_screen.dart';
import './screens/drawer_user_vehicles_screen.dart';
import './screens/drawer_admin_members_screen.dart';
import './screens/drawer_admin_members_details_screen.dart';
import './screens/drawer_admin_reservations_screen.dart';
import './screens/drawer_admin_reservations_history_screen.dart';
import './screens/drawer_admin_vehicles_screen.dart';
import './screens/overview_admin_disable_place_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return ChangeNotifierProvider(
      builder: (ctx) => Users(),
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          primaryColor: Colors.white,
          fontFamily: 'OpenSans',
        ),
        home: SignInScreen(),
        //home: AdminOverviewScreen(),
        //home: UserOverviewScreen(),
        routes: {
          SignUpScreen.routeName: (ctx) => SignUpScreen(),
          UserOverviewScreen.routeName: (ctx) => UserOverviewScreen(),
          ProfileScreen.routeName: (ctx) => ProfileScreen(),
          ReservationScreen.routeName: (ctx) => ReservationScreen(),
          VehiclesScreen.routeName: (ctx) => VehiclesScreen(),
          AdminOverviewScreen.routeName: (ctx) => AdminOverviewScreen(),
          MembersScreen.routeName: (ctx) => MembersScreen(),
          MemberDetailsScreen.routeName: (ctx) => MemberDetailsScreen(),
          AdminReservationScreen.routeName: (ctx) => AdminReservationScreen(),
          ReservationsHistoryScreen.routeName: (ctx) =>
              ReservationsHistoryScreen(),
          AdminVehiclesScreen.routeName: (ctx) => AdminVehiclesScreen(),
          DisablePlaceScreen.routeName: (ctx) => DisablePlaceScreen(),
        },
      ),
    );
  }
}
