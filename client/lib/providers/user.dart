import 'package:flutter/material.dart';

import './vehicle.dart';

class User {
  int id;
  String name;
  String surname;
  String email;
  int phoneNo;
  String password;
  List<Vehicle> vehicles;

  User({
    @required this.id,
    @required this.name,
    @required this.surname,
    @required this.email,
    @required this.phoneNo,
    @required this.password,
    @required this.vehicles,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    email = json['e_mail'];
    phoneNo = json['phone_number'];
    password = json['password'];
    List vehiclesList = json['vehicles'];
    vehicles = vehiclesList.map((i) => Vehicle.fromJson(i)).toList();
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'surname': surname,
        'e_mail': email,
        'phone_number': phoneNo,
        'password': password,
        'vehicles': vehicles,
      };
}