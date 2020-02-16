import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './user.dart';
import './vehicle.dart';

const API_BASE_URL = 'http://192.168.0.178:8080';

class Users with ChangeNotifier {
  User _currentUser;

  User get currentUser {
    return _currentUser;
  }

  Future<User> reloadCurrentUser() async {
    await findById(_currentUser.id);
    notifyListeners();
    return _currentUser;
  }

  Future<User> findById(int id) async {
    final url = '$API_BASE_URL/users/$id';

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        _currentUser = User.fromJson(json.decode(response.body));
        print("got " + _currentUser.toJson().toString());
        return _currentUser;
      } else {
        throw ('Could not find user with id $id');
      }
    } catch (error) {
      throw (error);
    } finally {
      notifyListeners();
    }
  }

  Future<void> updateUser(int id, User newUser) async {
    var client = new http.Client();
    await updateUserInternal(client, id, newUser);
  }

  Future updateUserInternal(http.Client client, int id, User newUser) async {
    final url = '$API_BASE_URL/users/$id';
    await client.put(url,
        headers: {"Content-type": "application/json"},
        body: json.encode(newUser.toJson()));
    notifyListeners();
  }

  Future<void> addVehicle(int id, Vehicle vehicle) async {
    final url = '$API_BASE_URL/users/$id/vehicle';

    try {
      final response = await http.post(url,
          headers: {"Content-type": "application/json"},
          body: json.encode(vehicle.toJson()));
      if (response.statusCode == 200) {
        await reloadCurrentUser();
      } else {
        print("Could not add vehicle ${response.statusCode}");
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> deleteVehicle(int id) async {
    final url = '$API_BASE_URL/users/vehicle/$id';

    final response = await http.delete(url);
    if (response.statusCode != 200) {
      notifyListeners();
      throw ('Could not delete vehicle.');
    } else {
      await reloadCurrentUser();
    }
  }
}
