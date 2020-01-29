import 'package:flutter/material.dart';

class User {
  int id;
  String name;
  String surname;
  String email;
  int phoneNo;
  String password;

  User({
    @required this.id,
    @required this.name,
    @required this.surname,
    @required this.email,
    @required this.phoneNo,
    @required this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    email = json['e_mail'];
    phoneNo = json['phone_number'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'surname': surname,
        'e_mail': email,
        'phone_number': phoneNo,
        'password': password,
      };
}
