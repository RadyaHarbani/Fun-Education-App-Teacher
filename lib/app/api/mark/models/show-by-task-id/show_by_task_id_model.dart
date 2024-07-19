import 'package:fun_education_app_teacher/app/api/mark/models/show-by-task-id/show_by_task_id_images.dart';

class ShowByTaskIdModel {
  String? id;
  String? tugasId;
  String? fullName;
  String? profilePicture;
  String? status;
  String? note;
  int? grade;
  DateTime? createdAt;
  List<ShowByTaskIdImagesModel>? images;

  ShowByTaskIdModel({
    this.id,
    this.tugasId,
    this.fullName,
    this.profilePicture,
    this.status,
    this.note,
    this.grade,
    this.createdAt,
    this.images,
  });

  factory ShowByTaskIdModel.fromJson(Map<String, dynamic> json) =>
      ShowByTaskIdModel(
        id: json["id"],
        tugasId: json["tugas_id"],
        fullName: json["full_name"],
        profilePicture: json["profile_picture"],
        status: json["status"],
        note: json["note"],
        grade: json["grade"],
        createdAt: DateTime.parse(json["created_at"]),
        images: List<ShowByTaskIdImagesModel>.from(
            json["images"].map((x) => ShowByTaskIdImagesModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tugas_id": tugasId,
        "full_name": fullName,
        "profile_picture": profilePicture,
        "status": status,
        "note": note,
        "grade": grade,
        "created_at": createdAt!.toIso8601String(),
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
      };
}
