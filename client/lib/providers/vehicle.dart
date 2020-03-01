import 'package:flutter/material.dart';

class Vehicle {
  int id;
  String brand;
  String model;
  String registration_no;
  int userId;

  Vehicle({
    @required this.id,
    @required this.brand,
    @required this.model,
    @required this.registration_no,
    @required this.userId
  });

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    model = json['model'];
    registration_no = json['registration_no'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'brand': brand,
        'model': model,
        'registration_no': registration_no,
        'userId': userId
      };

  String getName(){
    return "$brand $model : $registration_no";
  }
}
