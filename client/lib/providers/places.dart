import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:parking_app/providers/place.dart';

import 'config.dart';

class Places with ChangeNotifier {
  List<Place> _places = [];

  int _selectedPlaceIndex;

  List<Place> get places {
    return [..._places];
  }

  int get selectedPlaceIndex {
    return _selectedPlaceIndex;
  }

  void selectPlace(int index) {
    _selectedPlaceIndex = index;
  }

  Future<List<Place>> fetchAndSetPlaces() async {
    final url = '$API_BASE_URL/places/';

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      final List<Place> loadedPlace = [];

      extractedData.forEach((placeData) {
        loadedPlace.add(Place.fromJson(placeData));
      });

      _places = loadedPlace;
      notifyListeners();

      print(json.decode(response.body));
      return _places;
    } catch (error) {
      throw (error);
    }
  }
}
