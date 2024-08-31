class TotalSavingsModel {
  String? id;
  String? userId;
  String? saving;
  int? savingInt;
  String? lastIncome;
  String? lastOutcome;

  TotalSavingsModel({
    this.id,
    this.userId,
    this.saving,
    this.savingInt,
    this.lastIncome,
    this.lastOutcome,
  });

  factory TotalSavingsModel.fromJson(Map<String, dynamic> json) =>
      TotalSavingsModel(
        id: json["id"],
        userId: json["user_id"],
        saving: json["saving"],
        savingInt: json["saving_int"],
        lastIncome: json["last_income"],
        lastOutcome: json["last_outcome"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "saving": saving,
        "saving_int": savingInt,
        "last_income": lastIncome,
        "last_outcome": lastOutcome,
      };
}
