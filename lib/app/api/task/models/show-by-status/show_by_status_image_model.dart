class ShowByStatusImageModel {
    String? id;
    String? tugasId;
    String? image;

    ShowByStatusImageModel({
        this.id,
        this.tugasId,
        this.image,
    });

    factory ShowByStatusImageModel.fromJson(Map<String, dynamic> json) => ShowByStatusImageModel(
        id: json["id"],
        tugasId: json["tugas_id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tugas_id": tugasId,
        "image": image,
    };
}
