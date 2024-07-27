// To parse this JSON data, do
//
//     final showUserResponse = showUserResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/daily-report/models/show-user/show_user_model.dart';

ShowUserResponse showUserResponseFromJson(String str) => ShowUserResponse.fromJson(json.decode(str));

String showUserResponseToJson(ShowUserResponse data) => json.encode(data.toJson());

class ShowUserResponse {
    List<ShowUserModel> data;

    ShowUserResponse({
        required this.data,
    });

    factory ShowUserResponse.fromJson(Map<String, dynamic> json) => ShowUserResponse(
        data: List<ShowUserModel>.from(json["data"].map((x) => ShowUserModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}