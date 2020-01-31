import 'package:flutter/material.dart';

import './vehicle.dart';

class Vehicles with ChangeNotifier {
  List<Vehicle> _vehicleList = [];

  List<Vehicle> get vehicleList {
    return [..._vehicleList];
  }
}
