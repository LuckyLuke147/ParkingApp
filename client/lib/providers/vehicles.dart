import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './vehicle.dart';

class Vehicles with ChangeNotifier {
  List<Vehicle> _vehicleList = [];

  List<Vehicle> get vehicleList {
    return [..._vehicleList];
  }

  Future<List<Vehicle>> fetchAndSetVehicles() async {
    final url = 'http://192.168.0.178:8080/vehicles/';

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      final List<Vehicle> loadedUsers = [];

      extractedData.forEach((userData) {
        loadedUsers.add(Vehicle.fromJson(userData));
      });

      _vehicleList = loadedUsers;
      notifyListeners();

      print(json.decode(response.body));

      return _vehicleList;
    } catch (error) {
      throw (error);
    }
  }
}
