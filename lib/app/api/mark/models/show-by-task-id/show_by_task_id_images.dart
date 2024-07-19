class ShowByTaskIdImagesModel {
  String? id;
  String? tugasUserId;
  String? image;

  ShowByTaskIdImagesModel({
    this.id,
    this.tugasUserId,
    this.image,
  });

  factory ShowByTaskIdImagesModel.fromJson(Map<String, dynamic> json) =>
      ShowByTaskIdImagesModel(
        id: json["id"],
        tugasUserId: json["tugas_user_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tugas_user_id": tugasUserId,
        "image": image,
      };
}
