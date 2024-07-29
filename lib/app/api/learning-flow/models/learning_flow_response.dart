// To parse this JSON data, do
//
//     final learningFlowResponse = learningFlowResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/learning-flow/models/learning_flow_model.dart';

LearningFlowResponse learningFlowResponseFromJson(String str) =>
    LearningFlowResponse.fromJson(json.decode(str));

String learningFlowResponseToJson(LearningFlowResponse data) =>
    json.encode(data.toJson());

class LearningFlowResponse {
  LearningFlowModel data;

  LearningFlowResponse({
    required this.data,
  });

  factory LearningFlowResponse.fromJson(Map<String, dynamic> json) =>
      LearningFlowResponse(
        data: LearningFlowModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}
