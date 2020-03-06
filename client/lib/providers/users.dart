import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'package:parking_app/providers/reservation.dart';

import './user.dart';
import './vehicle.dart';
import 'config.dart';

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

  Future<void> addUser(User user) async {
    final url = '$API_BASE_URL/users';

    try {
      user.password = toMd5(user.password);
      final response = await http.post(url,
          headers: {"Content-type": "application/json"},
          body: json.encode(user.toJson()));

      if (response.statusCode == 201) {
        final newUser = User(
          id: json.decode(response.body)['id'],
          name: user.name,
          surname: user.surname,
          email: user.email,
          phoneNo: user.phoneNo,
          password: user.password,
        );
        _currentUser = newUser;
        print("user ${_currentUser.toString()}");
        notifyListeners();
      }
    } catch (error) {
      print(error);
      throw error;
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

  Future<void> addReservation(int id, Reservation reservation) async {
    final url = '$API_BASE_URL/users/$id/reservation';

    try {
      final response = await http.post(url,
          headers: {"Content-type": "application/json"},
          body: json.encode(reservation.toJson()));
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

  Future<User> signIn(String email, String password) async {
    final url = '$API_BASE_URL/users/signin';

    try {
      User user = new User();
      user.email = email;
      user.password = toMd5(password);
      print("password ${user.password}");
      final response = await http.post(url,
          headers: {"Content-type": "application/json"},
          body: json.encode(user.toJson()));
      if (response.statusCode == 200) {
        _currentUser = User.fromJson(json.decode(response.body));
        return _currentUser;
      } else {
        print("Could not add vehicle ${response.statusCode}");
        _currentUser = null;
      }
    } catch (error) {
      print(error);
      throw error;
    }
  }

  String toMd5(String value) {
    return hex.encode(md5.convert(utf8.encode(value)).bytes);
  }
}
