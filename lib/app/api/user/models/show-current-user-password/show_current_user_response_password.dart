// To parse this JSON data, do
//
//     final showCurrentUserResponse = showCurrentUserResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/user/models/show-current-user-password/show_current_user_model_password.dart';


ShowCurrentUserResponsePassword showCurrentUserResponseFromJson(String str) => ShowCurrentUserResponsePassword.fromJson(json.decode(str));

String showCurrentUserResponseToJson(ShowCurrentUserResponsePassword data) => json.encode(data.toJson());

class ShowCurrentUserResponsePassword {
    ShowCurrentUserModelPassword data;

    ShowCurrentUserResponsePassword({
        required this.data,
    });

    factory ShowCurrentUserResponsePassword.fromJson(Map<String, dynamic> json) => ShowCurrentUserResponsePassword(
        data: ShowCurrentUserModelPassword.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

