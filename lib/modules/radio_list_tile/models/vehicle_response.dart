class VehicleResponse {
  List<Vehicle>? vehicle;

  VehicleResponse({this.vehicle});

  VehicleResponse.fromJson(Map<String, dynamic> json) {
    if (json['vehicle'] != null) {
      vehicle = <Vehicle>[];
      json['vehicle'].forEach((v) {
        vehicle!.add(Vehicle.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (vehicle != null) {
      data['vehicle'] = vehicle!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vehicle {
  String? id;
  String? title;
  int? exteriorPrice;
  int? exteriorAndInteriorPrice;
  String? image;
  String? description;

  Vehicle(
      {this.id,
      this.title,
      this.exteriorPrice,
      this.exteriorAndInteriorPrice,
      this.image,
      this.description});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    exteriorPrice = json['exteriorPrice'];
    exteriorAndInteriorPrice = json['exteriorAndInteriorPrice'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['exteriorPrice'] = exteriorPrice;
    data['exteriorAndInteriorPrice'] = exteriorAndInteriorPrice;
    data['image'] = image;
    data['description'] = description;
    return data;
  }
}