import 'package:parking_app/providers/parking_space.dart';

class Place {
  int id;
  String city;
  String street;
  String building_no;
  List<ParkingSpace> parking_spaces;

  Place({
    this.id,
    this.city,
    this.street,
    this.building_no,
    this.parking_spaces,
  });

  Place.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.city = json['city'];
    this.street = json['street'];
    this.building_no = json['building_no'];
    List placesList = json['parking_space'];
    parking_spaces = placesList.map((i) => ParkingSpace.fromJson(i)).toList();
  }
}
