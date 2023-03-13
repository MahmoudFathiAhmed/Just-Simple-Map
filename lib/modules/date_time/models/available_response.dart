// class AvailableResponse {
//   List<String>? time;

//   AvailableResponse({this.time});

//   AvailableResponse.fromJson(Map<String, dynamic> json) {
//     time = json['time'].cast<String>();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['time'] = time;
//     return data;
//   }
// }


// To parse this JSON data, do
//
//     final availableResponse = availableResponseFromJson(jsonString);

import 'dart:convert';

AvailableResponse availableResponseFromJson(String str) => AvailableResponse.fromJson(json.decode(str));

String availableResponseToJson(AvailableResponse data) => json.encode(data.toJson());

class AvailableResponse {
    AvailableResponse({
        required this.time,
    });

    List<DateTime> time;

    factory AvailableResponse.fromJson(Map<String, dynamic> json) => AvailableResponse(
        time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
    );

    Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) => x.toIso8601String())),
    };
}

