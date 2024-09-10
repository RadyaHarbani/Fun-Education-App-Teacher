// To parse this JSON data, do
//
//     final showAvailableYearResponse = showAvailableYearResponseFromJson(jsonString);

import 'dart:convert';

ShowAvailableYearResponse showAvailableYearResponseFromJson(String str) => ShowAvailableYearResponse.fromJson(json.decode(str));

String showAvailableYearResponseToJson(ShowAvailableYearResponse data) => json.encode(data.toJson());

class ShowAvailableYearResponse {
    List<int> data;

    ShowAvailableYearResponse({
        required this.data,
    });

    factory ShowAvailableYearResponse.fromJson(Map<String, dynamic> json) => ShowAvailableYearResponse(
        data: List<int>.from(json["data"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x)),
    };
}
