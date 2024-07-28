// To parse this JSON data, do
//
//     final leaderboardResponse = leaderboardResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/leaderboard/models/leaderboard_model.dart';

LeaderboardResponse leaderboardResponseFromJson(String str) =>
    LeaderboardResponse.fromJson(json.decode(str));

String leaderboardResponseToJson(LeaderboardResponse data) =>
    json.encode(data.toJson());

class LeaderboardResponse {
  List<LeaderboardModel> data;

  LeaderboardResponse({
    required this.data,
  });

  factory LeaderboardResponse.fromJson(Map<String, dynamic> json) =>
      LeaderboardResponse(
        data: List<LeaderboardModel>.from(
            json["data"].map((x) => LeaderboardModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
