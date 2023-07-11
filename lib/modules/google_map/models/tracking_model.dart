class TrackingModel {
  LocationPoint? source;
  LocationPoint? destination;

  TrackingModel({this.source, this.destination});

  TrackingModel.fromJson(Map<String, dynamic> json) {
    source =
    json['source'] != null ? LocationPoint.fromJson(json['source']) : null;
    destination = json['destination'] != null
        ? LocationPoint.fromJson(json['destination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    if (destination != null) {
      data['destination'] = destination!.toJson();
    }
    return data;
  }
}

class LocationPoint {
  double? latitude;
  double? longitude;

  LocationPoint({this.latitude, this.longitude});

  LocationPoint.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}