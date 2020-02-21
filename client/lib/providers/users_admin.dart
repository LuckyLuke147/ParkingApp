import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';
import 'package:http/http.dart' as http;
import 'package:parking_app/providers/vehicle.dart';

import './user.dart';

const API_BASE_URL = 'http://192.168.0.178:8080';

class UsersAdmin with ChangeNotifier {
  List<User> _users = [];
  List<Vehicle> _vehicles = [];

  int _selectedUserIndex;
  int _selectedVehicleIndex;

  List<User> get users {
    return [..._users];
  }

  List<Vehicle> get vehicles {
    return [..._vehicles];
  }

  int get selectedUserIndex {
    return _selectedUserIndex;
  }

  int get selectedVehicleIndex {
    return _selectedVehicleIndex;
  }

  void selectUser(int index) {
    _selectedUserIndex = index;
  }

  void selectVehicle(int index) {
    _selectedVehicleIndex = index;
  }

  

  Future<List<User>> fetchAndSetUsers() async {
    final url = '$API_BASE_URL/users/';

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      final List<User> loadedUsers = [];

      extractedData.forEach((userData) {
        loadedUsers.add(User.fromJson(userData));
      });

      _users = loadedUsers;
      notifyListeners();

      print(json.decode(response.body));

      return _users;
    } catch (error) {
      throw (error);
    }
  }



  String toMd5(String value) {
    return hex.encode(md5.convert(utf8.encode(value)).bytes);
  }

  Future<void> deleteUser(int userId) async {
    final url = '$API_BASE_URL/users/$userId';

    final response = await http.delete(url);
    if (response.statusCode != 200) {
      notifyListeners();
      throw ('Could not delete user.');
    } else {
      await fetchAndSetUsers();
    }
  }

  Future<List<Vehicle>> fetchAndSetVehicles() async {
    final url = '$API_BASE_URL/vehicles/';

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      final List<Vehicle> loadedVehicles = [];

      extractedData.forEach((vehicleData) {
        loadedVehicles.add(Vehicle.fromJson(vehicleData));
      });

      _vehicles = loadedVehicles;
      notifyListeners();

      print(json.decode(response.body));      
      return _vehicles;
    } catch (error) {
      throw (error);
    }
  }
}
