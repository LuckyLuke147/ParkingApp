import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parking_app/providers/reservation.dart';

import './user.dart';
import './vehicle.dart';

class Reservations with ChangeNotifier {
  Reservation _currentReservation;

  Reservation get currentReservation {
    return _currentReservation;
  }

  void initializeReservation() {
    _currentReservation = new Reservation();
    _currentReservation.fromDate = DateTime.now();
    _currentReservation.toDate = DateTime.now();
  }

  setCity(String city){
    _currentReservation.city = city;
    notifyListeners();
  }

  setFromDate(DateTime fromDate){
    _currentReservation.fromDate = fromDate;
    notifyListeners();
  }
  setToDate(DateTime toDate){
    _currentReservation.toDate = toDate;
    notifyListeners();
  }
}
