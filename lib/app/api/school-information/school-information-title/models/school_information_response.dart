// To parse this JSON data, do
//
//     final schoolInformationResponse = schoolInformationResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/school-information/school-information-title/models/school_information_title_model.dart';

SchoolInformationResponse schoolInformationResponseFromJson(String str) => SchoolInformationResponse.fromJson(json.decode(str));

String schoolInformationResponseToJson(SchoolInformationResponse data) => json.encode(data.toJson());

class SchoolInformationResponse {
    List<SchoolInformationTitleModel> data;

    SchoolInformationResponse({
        required this.data,
    });

    factory SchoolInformationResponse.fromJson(Map<String, dynamic> json) => SchoolInformationResponse(
        data: List<SchoolInformationTitleModel>.from(json["data"].map((x) => SchoolInformationTitleModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}