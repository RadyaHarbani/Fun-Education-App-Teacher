class TransactionModel {
  String? id;
  String? userId;
  String? category;
  String? amount;
  String? desc;
  DateTime? date;

  TransactionModel({
    this.id,
    this.userId,
    this.category,
    this.amount,
    this.desc,
    this.date,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"],
        userId: json["user_id"],
        category: json["category"],
        amount: json["amount"],
        desc: json["desc"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "category": category,
        "amount": amount,
        "desc": desc,
        "date": date?.toIso8601String(),
      };
}
