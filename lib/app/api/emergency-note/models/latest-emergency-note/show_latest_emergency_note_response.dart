// To parse this JSON data, do
//
//     final showLatestEmergencyNoteResponse = showLatestEmergencyNoteResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/emergency-note/models/latest-emergency-note/show_latest_emergency_note_model.dart';

ShowLatestEmergencyNoteResponse showLatestEmergencyNoteResponseFromJson(String str) => ShowLatestEmergencyNoteResponse.fromJson(json.decode(str));

String showLatestEmergencyNoteResponseToJson(ShowLatestEmergencyNoteResponse data) => json.encode(data.toJson());

class ShowLatestEmergencyNoteResponse {
    ShowLatestEmergencyNoteModel data;

    ShowLatestEmergencyNoteResponse({
        required this.data,
    });

    factory ShowLatestEmergencyNoteResponse.fromJson(Map<String, dynamic> json) => ShowLatestEmergencyNoteResponse(
        data: ShowLatestEmergencyNoteModel.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

