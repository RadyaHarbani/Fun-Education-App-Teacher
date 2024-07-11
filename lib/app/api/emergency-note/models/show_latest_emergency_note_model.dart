class ShowLatestEmergencyNoteModel {
    String? id;
    String? catatan;
    bool? isDeleted;

    ShowLatestEmergencyNoteModel({
        this.id,
        this.catatan,
        this.isDeleted,
    });

    factory ShowLatestEmergencyNoteModel.fromJson(Map<String, dynamic> json) => ShowLatestEmergencyNoteModel(
        id: json["id"],
        catatan: json["catatan"],
        isDeleted: json["is_deleted"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "catatan": catatan,
        "is_deleted": isDeleted,
    };
}
