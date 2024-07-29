// To parse this JSON data, do
//
//     final savingSubmissionResponse = savingSubmissionResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/savings/savings-submission/models/saving_submission_model.dart';

SavingSubmissionResponse savingSubmissionResponseFromJson(String str) => SavingSubmissionResponse.fromJson(json.decode(str));

String savingSubmissionResponseToJson(SavingSubmissionResponse data) => json.encode(data.toJson());

class SavingSubmissionResponse {
    SavingSubmissionModel data;

    SavingSubmissionResponse({
        required this.data,
    });

    factory SavingSubmissionResponse.fromJson(Map<String, dynamic> json) => SavingSubmissionResponse(
        data: SavingSubmissionModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}