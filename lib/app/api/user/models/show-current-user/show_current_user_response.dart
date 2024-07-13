// To parse this JSON data, do
//
//     final showCurrentUserResponse = showCurrentUserResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/user/models/show-current-user/show_current_user_model.dart';


ShowCurrentUserResponse showCurrentUserResponseFromJson(String str) => ShowCurrentUserResponse.fromJson(json.decode(str));

String showCurrentUserResponseToJson(ShowCurrentUserResponse data) => json.encode(data.toJson());

class ShowCurrentUserResponse {
    ShowCurrentUserModel data;

    ShowCurrentUserResponse({
        required this.data,
    });

    factory ShowCurrentUserResponse.fromJson(Map<String, dynamic> json) => ShowCurrentUserResponse(
        data: ShowCurrentUserModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

