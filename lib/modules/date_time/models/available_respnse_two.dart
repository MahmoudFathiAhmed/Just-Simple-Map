// To parse this JSON data, do
//
//     final availableResponseTwo = availableResponseTwoFromJson(jsonString);

import 'dart:convert';

AvailableResponseTwo availableResponseTwoFromJson(String str) => AvailableResponseTwo.fromJson(json.decode(str));

String availableResponseTwoToJson(AvailableResponseTwo data) => json.encode(data.toJson());

class AvailableResponseTwo {
    AvailableResponseTwo({
        required this.time,
    });

    List<DateTime> time;

    factory AvailableResponseTwo.fromJson(Map<String, dynamic> json) => AvailableResponseTwo(
        time: List<DateTime>.from(json["time"].map((x) => DateTime.parse(x))),
    );

    Map<String, dynamic> toJson() => {
        "time": List<dynamic>.from(time.map((x) => x.toIso8601String())),
    };
}

