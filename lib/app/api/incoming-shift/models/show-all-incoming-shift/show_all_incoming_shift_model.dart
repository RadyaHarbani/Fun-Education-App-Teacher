class ShowAllIncomingShiftModel {
  int? id;
  String? shiftMasuk;

  ShowAllIncomingShiftModel({
    this.id,
    this.shiftMasuk,
  });

  factory ShowAllIncomingShiftModel.fromJson(Map<String, dynamic> json) =>
      ShowAllIncomingShiftModel(
        id: json["id"],
        shiftMasuk: json["shift_masuk"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "shift_masuk": shiftMasuk,
      };
}
