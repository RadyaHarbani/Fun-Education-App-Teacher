import 'package:fun_education_app_teacher/app/api/task/models/show-by-status/show_by_status_image_model.dart';

class ShowByStatusModel {
    String? id;
    String? shift;
    String? category;
    String? title;
    String? description;
    String? status;
    int? point;
    DateTime? deadline;
    DateTime? createdAt;
    List<ShowByStatusImageModel>? images;

    ShowByStatusModel({
        this.id,
        this.shift,
        this.category,
        this.title,
        this.description,
        this.status,
        this.point,
        this.deadline,
        this.createdAt,
        this.images,
    });

    factory ShowByStatusModel.fromJson(Map<String, dynamic> json) => ShowByStatusModel(
        id: json["id"],
        shift: json["shift"],
        category: json["category"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        point: json["point"],
        deadline: DateTime.parse(json["deadline"]),
        createdAt: DateTime.parse(json["created_at"]),
        images: List<ShowByStatusImageModel>.from(json["images"].map((x) => ShowByStatusImageModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "shift": shift,
        "category": category,
        "title": title,
        "description": description,
        "status": status,
        "point": point,
        "deadline": "${deadline!.year.toString().padLeft(4, '0')}-${deadline!.month.toString().padLeft(2, '0')}-${deadline!.day.toString().padLeft(2, '0')}",
        "created_at": "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
        "images": List<dynamic>.from(images!.map((x) => x.toJson())),
    };
}