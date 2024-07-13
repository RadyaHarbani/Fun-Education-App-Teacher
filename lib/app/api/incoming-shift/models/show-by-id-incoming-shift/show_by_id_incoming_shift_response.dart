// To parse this JSON data, do
//
//     final showByIdIncomingShiftResponse = showByIdIncomingShiftResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/incoming-shift/models/show-all-incoming-shift/show_all_incoming_shift_model.dart';

ShowByIdIncomingShiftResponse showByIdIncomingShiftResponseFromJson(
        String str) =>
    ShowByIdIncomingShiftResponse.fromJson(json.decode(str));

String showByIdIncomingShiftResponseToJson(
        ShowByIdIncomingShiftResponse data) =>
    json.encode(data.toJson());

class ShowByIdIncomingShiftResponse {
  ShowAllIncomingShiftModel data;

  ShowByIdIncomingShiftResponse({
    required this.data,
  });

  factory ShowByIdIncomingShiftResponse.fromJson(Map<String, dynamic> json) =>
      ShowByIdIncomingShiftResponse(
        data: ShowAllIncomingShiftModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}
