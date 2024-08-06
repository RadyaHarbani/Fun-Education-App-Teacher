// To parse this JSON data, do
//
//     final showAvailableDateResponse = showAvailableDateResponseFromJson(jsonString);

import 'dart:convert';

ShowAvailableDateResponse showAvailableDateResponseFromJson(String str) =>
    ShowAvailableDateResponse.fromJson(json.decode(str));

String showAvailableDateResponseToJson(ShowAvailableDateResponse data) =>
    json.encode(data.toJson());

class ShowAvailableDateResponse {
  List<DateTime> dates;

  ShowAvailableDateResponse({
    required this.dates,
  });

  factory ShowAvailableDateResponse.fromJson(Map<String, dynamic> json) =>
      ShowAvailableDateResponse(
        dates: List<DateTime>.from(json["dates"].map((x) => DateTime.parse(x))),
      );

  Map<String, dynamic> toJson() => {
        "dates": List<dynamic>.from(dates.map((x) => x.toIso8601String())),
      };
}
