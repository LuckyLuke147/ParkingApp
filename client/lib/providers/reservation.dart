import 'package:flutter/material.dart';
import 'package:parking_app/providers/vehicle.dart';

class Reservation {
  int id;
  String city;
  DateTime fromDate;
  DateTime toDate;
  String car;
  int userId;

  Reservation({
    @required this.id,
    @required this.city,
    @required this.fromDate,
    @required this.toDate,
    @required this.car,
    @required this.userId,
  });

  Reservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json[''];
    fromDate = json[''];
    toDate = json[''];
    car = json[''];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'city': city,
        'fromDate': fromDate,
        'toDate': toDate,
        'car': car,
        'userId': userId,
      };
}
