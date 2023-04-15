class VehiclesTypeResponse{
  List<Vehicle>? vehicles;
  VehiclesTypeResponse(this.vehicles);
  VehiclesTypeResponse.fromJson(Map<String, dynamic>json){
    if (json['vehicle'] != null) {
      vehicles = <Vehicle>[];
      json['vehicle'].forEach((v) {
        vehicles!.add(Vehicle.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    if (vehicles != null) {
      json['vehicle'] =
          vehicles!.map((v) => v.toJson()).toList();
    }
    return json;
  }
}

class Vehicle {
  String? id;
  String? title;
  int? exteriorPrice;
  int? exteriorAndInteriorPrice;
  String? image;
  String? description;

  Vehicle({
    required this.id,
    required this.title,
    required this.exteriorPrice,
    required this.exteriorAndInteriorPrice,
    required this.image,
    required this.description,
  });
  Vehicle.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    title = json['title'];
    exteriorPrice = json['exteriorPrice'];
    exteriorAndInteriorPrice = json['exteriorAndInteriorPrice'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['_id'] = id;
    json['title'] = title;
    json['exteriorPrice'] = exteriorPrice;
    json['exteriorAndInteriorPrice'] = exteriorAndInteriorPrice;
    json['image'] = image;
    json['description'] = description;

    return json;
  }
}
