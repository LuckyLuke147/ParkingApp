import 'package:flutter/material.dart';
import 'package:parking_app/providers/vehicle.dart';

class Reservation {
  int id;
  int placeId;
  DateTime fromDate;
  DateTime toDate;
  int vehicleId;
  int userId;

  Reservation({
    @required this.id,
    @required this.placeId,
    @required this.fromDate,
    @required this.toDate,
    @required this.vehicleId,
    @required this.userId,
  });

  Reservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicleId = json[''];
    fromDate = json[''];
    toDate = json[''];
    placeId = json[''];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'placeId': placeId,
        'dateTimeStart': fromDate.toIso8601String(),
        'dateTimeEnd': toDate.toIso8601String(),
        'vehicleId': vehicleId,
        'userId': userId,
      };
}
