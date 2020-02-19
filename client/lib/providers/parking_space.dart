class ParkingSpace {
  int id;
  String position;
  bool isFree;

  ParkingSpace({
    this.id,
    this.position,
    this.isFree,
  });

  ParkingSpace.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.position = json['position'];
    this.isFree = json['free'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'position': position,
        'free': isFree,
      };
}
