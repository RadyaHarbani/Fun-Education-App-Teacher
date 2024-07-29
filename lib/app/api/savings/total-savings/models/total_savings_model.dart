class TotalSavingsModel {
  String? id;
  String? userId;
  String? saving;
  String? lastIncome;
  String? lastOutcome;

  TotalSavingsModel({
    this.id,
    this.userId,
    this.saving,
    this.lastIncome,
    this.lastOutcome,
  });

  factory TotalSavingsModel.fromJson(Map<String, dynamic> json) =>
      TotalSavingsModel(
        id: json["id"],
        userId: json["user_id"],
        saving: json["saving"],
        lastIncome: json["last_income"],
        lastOutcome: json["last_outcome"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "saving": saving,
        "last_income": lastIncome,
        "last_outcome": lastOutcome,
      };
}
