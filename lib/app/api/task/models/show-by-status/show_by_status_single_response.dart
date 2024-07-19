// To parse this JSON data, do
//
//     final showByStatusSingleResponse = showByStatusSingleResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/task/models/show-by-status/show_by_status_model.dart';

ShowByStatusSingleResponse showByStatusSingleResponseFromJson(String str) => ShowByStatusSingleResponse.fromJson(json.decode(str));

String showByStatusSingleResponseToJson(ShowByStatusSingleResponse data) => json.encode(data.toJson());

class ShowByStatusSingleResponse {
    ShowByStatusModel data;

    ShowByStatusSingleResponse({
        required this.data,
    });

    factory ShowByStatusSingleResponse.fromJson(Map<String, dynamic> json) => ShowByStatusSingleResponse(
        data: ShowByStatusModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}