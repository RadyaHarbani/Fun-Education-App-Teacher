class ShowAllPhotosModel {
  String? id;
  String? albumId;
  String? image;
  String? title;
  String? description;
  DateTime? createdAt;

  ShowAllPhotosModel({
    this.id,
    this.albumId,
    this.image,
    this.title,
    this.description,
    this.createdAt,
  });

  factory ShowAllPhotosModel.fromJson(Map<String, dynamic> json) =>
      ShowAllPhotosModel(
        id: json["id"],
        albumId: json["album_id"],
        image: json["image"],
        title: json["title"],
        description: json["description"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "album_id": albumId,
        "image": image,
        "title": title,
        "description": description,
        "created_at": createdAt!.toIso8601String(),
      };
}
