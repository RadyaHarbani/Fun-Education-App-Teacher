// To parse this JSON data, do
//
//     final showAllUserByIncomingShiftResponse = showAllUserByIncomingShiftResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_model.dart';

ShowAllUserByIncomingShiftResponse showAllUserByIncomingShiftResponseFromJson(String str) => ShowAllUserByIncomingShiftResponse.fromJson(json.decode(str));

String showAllUserByIncomingShiftResponseToJson(ShowAllUserByIncomingShiftResponse data) => json.encode(data.toJson());

class ShowAllUserByIncomingShiftResponse {
    List<ShowCurrentUserModel> data;

    ShowAllUserByIncomingShiftResponse({
        required this.data,
    });

    factory ShowAllUserByIncomingShiftResponse.fromJson(Map<String, dynamic> json) => ShowAllUserByIncomingShiftResponse(
        data: List<ShowCurrentUserModel>.from(json["data"].map((x) => ShowCurrentUserModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}