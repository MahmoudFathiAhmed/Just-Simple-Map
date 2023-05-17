class AvailabilityResponse2 {
  bool? isAvailable;
  String? time;

  AvailabilityResponse2({this.isAvailable, this.time});

  AvailabilityResponse2.fromJson(Map<String, dynamic> json) {
    isAvailable = json['isAvailable'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isAvailable'] = isAvailable;
    data['time'] = time;
    return data;
  }
}