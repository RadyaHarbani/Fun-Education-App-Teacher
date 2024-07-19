// To parse this JSON data, do
//
//     final showStatusCountResponse = showStatusCountResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/task/models/show-status-count/show_status_count_model.dart';

ShowStatusCountResponse showStatusCountResponseFromJson(String str) => ShowStatusCountResponse.fromJson(json.decode(str));

String showStatusCountResponseToJson(ShowStatusCountResponse data) => json.encode(data.toJson());

class ShowStatusCountResponse {
    ShowStatusCountModel data;

    ShowStatusCountResponse({
        required this.data,
    });

    factory ShowStatusCountResponse.fromJson(Map<String, dynamic> json) => ShowStatusCountResponse(
        data: ShowStatusCountModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}