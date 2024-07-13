// To parse this JSON data, do
//
//     final showAllIncomingShiftResponse = showAllIncomingShiftResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/incoming-shift/models/show-all-incoming-shift/show_all_incoming_shift_model.dart';

ShowAllIncomingShiftResponse showAllIncomingShiftResponseFromJson(String str) => ShowAllIncomingShiftResponse.fromJson(json.decode(str));

String showAllIncomingShiftResponseToJson(ShowAllIncomingShiftResponse data) => json.encode(data.toJson());

class ShowAllIncomingShiftResponse {
    List<ShowAllIncomingShiftModel> data;

    ShowAllIncomingShiftResponse({
        required this.data,
    });

    factory ShowAllIncomingShiftResponse.fromJson(Map<String, dynamic> json) => ShowAllIncomingShiftResponse(
        data: List<ShowAllIncomingShiftModel>.from(json["data"].map((x) => ShowAllIncomingShiftModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}