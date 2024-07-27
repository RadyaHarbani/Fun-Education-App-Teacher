// To parse this JSON data, do
//
//     final showByUserIdResponse = showByUserIdResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/daily-report/models/show-by-user-id/show_grade_model.dart';

ShowByUserIdResponse showByUserIdResponseFromJson(String str) =>
    ShowByUserIdResponse.fromJson(json.decode(str));

String showByUserIdResponseToJson(ShowByUserIdResponse data) =>
    json.encode(data.toJson());

class ShowByUserIdResponse {
  List<ShowGradeModel> data;
  String note;
  int totalPoint;

  ShowByUserIdResponse({
    required this.data,
    required this.note,
    required this.totalPoint,
  });

  factory ShowByUserIdResponse.fromJson(Map<String, dynamic> json) =>
      ShowByUserIdResponse(
        data: List<ShowGradeModel>.from(
            json["data"].map((x) => ShowGradeModel.fromJson(x))),
        note: json["note"],
        totalPoint: json["total_point"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "note": note,
        "total_point": totalPoint,
      };
}
