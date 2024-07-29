// To parse this JSON data, do
//
//     final totalSavingsResponse = totalSavingsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/savings/total-savings/models/total_savings_model.dart';

TotalSavingsResponse totalSavingsResponseFromJson(String str) => TotalSavingsResponse.fromJson(json.decode(str));

String totalSavingsResponseToJson(TotalSavingsResponse data) => json.encode(data.toJson());

class TotalSavingsResponse {
    TotalSavingsModel data;

    TotalSavingsResponse({
        required this.data,
    });

    factory TotalSavingsResponse.fromJson(Map<String, dynamic> json) => TotalSavingsResponse(
        data: TotalSavingsModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}