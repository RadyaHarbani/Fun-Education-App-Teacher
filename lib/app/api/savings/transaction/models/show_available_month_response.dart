// To parse this JSON data, do
//
//     final showAvailableMonthResponse = showAvailableMonthResponseFromJson(jsonString);

import 'dart:convert';

ShowAvailableMonthResponse showAvailableMonthResponseFromJson(String str) => ShowAvailableMonthResponse.fromJson(json.decode(str));

String showAvailableMonthResponseToJson(ShowAvailableMonthResponse data) => json.encode(data.toJson());

class ShowAvailableMonthResponse {
    List<String> data;

    ShowAvailableMonthResponse({
        required this.data,
    });

    factory ShowAvailableMonthResponse.fromJson(Map<String, dynamic> json) => ShowAvailableMonthResponse(
        data: List<String>.from(json["data"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x)),
    };
}