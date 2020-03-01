import 'package:flutter/material.dart';
import 'package:parking_app/providers/vehicle.dart';

class Reservation {
  int id;
  String city;
  DateTime fromDate;
  DateTime toDate;
  String timeBegin;
  String timeEnd;
  String car;
  int userId;

  Reservation({
    @required this.id,
    @required this.city,
    @required this.fromDate,
    @required this.toDate,
    @required this.timeBegin,
    @required this.timeEnd,
    @required this.car,
    @required this.userId,
  });

  Reservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    city = json[''];
    fromDate = json[''];
    toDate = json[''];
    timeBegin = json[''];
    timeEnd = json[''];
    car = json[''];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'city': city,
        'fromDate': fromDate,
        'toDate': toDate,
        'timeBegin': timeBegin,
        'timeEnd': timeEnd,
        'car': car,
        'userId': userId
      };
}
