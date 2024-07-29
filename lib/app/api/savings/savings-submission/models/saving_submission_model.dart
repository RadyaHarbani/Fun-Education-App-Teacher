class SavingSubmissionModel {
  String? id;
  String? userId;
  String? category;
  String? status;

  SavingSubmissionModel({
    this.id,
    this.userId,
    this.category,
    this.status,
  });

  factory SavingSubmissionModel.fromJson(Map<String, dynamic> json) =>
      SavingSubmissionModel(
        id: json["id"],
        userId: json["user_id"],
        category: json["category"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category": category,
        "status": status,
      };
}
