class FileEmergencyNote {
  String? id;
  String? name;
  String? catatanDaruratId;
  String? file;

  FileEmergencyNote({
    this.id,
    this.name,
    this.catatanDaruratId,
    this.file,
  });

  factory FileEmergencyNote.fromJson(Map<String, dynamic> json) =>
      FileEmergencyNote(
        id: json["id"],
        name: json["name"],
        catatanDaruratId: json["catatan_darurat_id"],
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "catatan_darurat_id": catatanDaruratId,
        "file": file,
      };
}
