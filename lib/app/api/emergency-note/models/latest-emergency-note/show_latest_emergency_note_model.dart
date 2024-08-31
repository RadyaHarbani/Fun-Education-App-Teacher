import 'package:fun_education_app_teacher/app/api/emergency-note/models/file-emergency-note/file_emergency_note.dart';

class ShowLatestEmergencyNoteModel {
  String? id;
  String? catatan;
  bool? isDeleted;
  List<FileEmergencyNote>? file;

  ShowLatestEmergencyNoteModel({
    this.id,
    this.catatan,
    this.isDeleted,
    this.file,
  });

  factory ShowLatestEmergencyNoteModel.fromJson(Map<String, dynamic> json) =>
      ShowLatestEmergencyNoteModel(
        id: json["id"],
        catatan: json["catatan"],
        isDeleted: json["is_deleted"],
        file: List<FileEmergencyNote>.from(
            json["file"].map((x) => FileEmergencyNote.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "catatan": catatan,
        "is_deleted": isDeleted,
        "file": List<dynamic>.from(file!.map((x) => x.toJson())),
      };
}
