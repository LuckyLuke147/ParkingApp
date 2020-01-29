import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './user.dart';

class Users with ChangeNotifier {
  List<User> _items = [];

  List<User> get items {
    return [..._items];
  }

  Future<List<User>> fetchAndSetUsers() async {
    final url = 'http://192.168.0.178:8080/users/';

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      final List<User> loadedUsers = [];

      extractedData.forEach((userData) {
        loadedUsers.add(User.fromJson(userData));
      });

      _items = loadedUsers;
      notifyListeners();

      print(json.decode(response.body));

      return _items;
    } catch (error) {
      throw (error);
    }
  }

  // Future<void> addUser(User user) async {
  //   final url = 'http://192.168.0.178:8080/users';

  //   try {
  //     final response = await http.post(
  //       url,
  //       body: json.encode({
  //         'name': user.name,
  //         'surname': user.surname,
  //         'e_mail': user.email,
  //         'phone_number': user.phoneNo,
  //         'password': user.password,
  //       }),
  //     );
  //     final newUser = User(
  //       id: json.decode(response.body)['id'],
  //       name: user.name,
  //       surname: user.surname,
  //       email: user.email,
  //       phoneNo: user.phoneNo,
  //       password: user.password,
  //     );
  //     _items.add(newUser);
  //     notifyListeners();
  //   } catch (error) {
  //     print(error);
  //     throw error;
  //   }
  // }





  Future<void> updateUser(int id, User newUser) async {
    var client = new http.Client();
    await updateUserInternal(client, id, newUser);
  }

  Future updateUserInternal(http.Client client, int id, User newUser) async {
    final userIndex = 0;
    if (userIndex >= 0) {
      final url = 'http://192.168.0.178:8080/users/$id';
      await client.put(url,
          headers: {"Content-type": "application/json"},
          body: jsonEncode(newUser.toJson()));
      updateIfStored(newUser);
      notifyListeners();
    } else {
      print('...');
    }
  }

  updateIfStored(newUser) {
    var matchingIdx = _items.indexWhere((user) => user.id == newUser);
    if (matchingIdx >= 0) {
      _items[matchingIdx] = newUser;
    }
  }
}
