// To parse this JSON data, do
//
//     final showByTaskIdResponse = showByTaskIdResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/mark/models/show-by-task-id/show_by_task_id_model.dart';

ShowByTaskIdResponse showByTaskIdResponseFromJson(String str) => ShowByTaskIdResponse.fromJson(json.decode(str));

String showByTaskIdResponseToJson(ShowByTaskIdResponse data) => json.encode(data.toJson());

class ShowByTaskIdResponse {
    List<ShowByTaskIdModel> data;

    ShowByTaskIdResponse({
        required this.data,
    });

    factory ShowByTaskIdResponse.fromJson(Map<String, dynamic> json) => ShowByTaskIdResponse(
        data: List<ShowByTaskIdModel>.from(json["data"].map((x) => ShowByTaskIdModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}