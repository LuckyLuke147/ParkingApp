import 'package:flutter/material.dart';

class Vehicle {
  int id;
  String brand;
  String model;
  String registration_no;

  Vehicle({
    @required this.id,
    @required this.brand,
    @required this.model,
    @required this.registration_no,
  });

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    model = json['model'];
    registration_no = json['registration_no'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'brand': brand,
        'model': model,
        'registration_no': registration_no,
      };
}
