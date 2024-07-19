// To parse this JSON data, do
//
//     final showByUserIdResponse = showByUserIdResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/mark/models/show-by-task-id/show_by_task_id_model.dart';

ShowByUserIdResponse showByUserIdResponseFromJson(String str) =>
    ShowByUserIdResponse.fromJson(json.decode(str));

String showByUserIdResponseToJson(ShowByUserIdResponse data) =>
    json.encode(data.toJson());

class ShowByUserIdResponse {
  ShowByTaskIdModel data;

  ShowByUserIdResponse({
    required this.data,
  });

  factory ShowByUserIdResponse.fromJson(Map<String, dynamic> json) =>
      ShowByUserIdResponse(
        data: ShowByTaskIdModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}
