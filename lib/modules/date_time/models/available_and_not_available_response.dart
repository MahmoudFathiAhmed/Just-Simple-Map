class AvailableAndNotAvailableResponse {
  List<Result>? result;

  AvailableAndNotAvailableResponse({this.result});

  AvailableAndNotAvailableResponse.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? day;
  int? hour;
  bool? ordersExist;

  Result({this.day, this.hour, this.ordersExist});

  Result.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    hour = json['hour'];
    ordersExist = json['ordersExist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['day'] = day;
    data['hour'] = hour;
    data['ordersExist'] = ordersExist;
    return data;
  }
}