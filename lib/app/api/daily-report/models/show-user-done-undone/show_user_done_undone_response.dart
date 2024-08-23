// To parse this JSON data, do
//
//     final showUserDoneUndoneResponse = showUserDoneUndoneResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/daily-report/models/show-user-done-undone/show_user_done_undone_model.dart';

ShowUserDoneUndoneResponse showUserDoneUndoneResponseFromJson(String str) => ShowUserDoneUndoneResponse.fromJson(json.decode(str));

String showUserDoneUndoneResponseToJson(ShowUserDoneUndoneResponse data) => json.encode(data.toJson());

class ShowUserDoneUndoneResponse {
    List<ShowUserDoneUndoneModel> data;

    ShowUserDoneUndoneResponse({
        required this.data,
    });

    factory ShowUserDoneUndoneResponse.fromJson(Map<String, dynamic> json) => ShowUserDoneUndoneResponse(
        data: List<ShowUserDoneUndoneModel>.from(json["data"].map((x) => ShowUserDoneUndoneModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}