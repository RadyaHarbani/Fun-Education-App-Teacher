import 'package:fun_education_app_teacher/app/api/gallery/photos/models/show_all_photos_model.dart';

class ShowAllAlbumsModel {
  String? id;
  String? name;
  String? desc;
  String? cover;
  DateTime? createdAt;
  int? galleryCount;
  List<ShowAllPhotosModel>? gallery;

  ShowAllAlbumsModel({
    this.id,
    this.name,
    this.desc,
    this.cover,
    this.createdAt,
    this.galleryCount,
    this.gallery,
  });

  factory ShowAllAlbumsModel.fromJson(Map<String, dynamic> json) =>
      ShowAllAlbumsModel(
          id: json["id"],
          name: json["name"],
          desc: json["desc"],
          cover: json["cover"],
          createdAt: DateTime.parse(json["created_at"]),
          galleryCount: json["gallery_count"],
          gallery: List<ShowAllPhotosModel>.from(
              json["gallery"].map((x) => ShowAllPhotosModel.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "desc": desc,
        "cover": cover,
        "created_at": createdAt!.toIso8601String(),
        "gallery_count": galleryCount,
        "gallery": List<dynamic>.from(gallery!.map((x) => x.toJson()))
      };
}
