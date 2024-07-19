// To parse this JSON data, do
//
//     final showByNewStatusResponse = showByNewStatusResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/task/models/show-by-status/show_by_status_model.dart';

ShowByStatusListResponse showByStatusListResponseFromJson(String str) => ShowByStatusListResponse.fromJson(json.decode(str));

String showByStatusListResponseToJson(ShowByStatusListResponse data) => json.encode(data.toJson());

class ShowByStatusListResponse {
    List<ShowByStatusModel> data;

    ShowByStatusListResponse({
        required this.data,
    });

    factory ShowByStatusListResponse.fromJson(Map<String, dynamic> json) => ShowByStatusListResponse(
        data: List<ShowByStatusModel>.from(json["data"].map((x) => ShowByStatusModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}