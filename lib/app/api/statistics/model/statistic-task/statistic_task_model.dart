class StatisticTaskModel {
  DateTime? date;
  // String? title;
  int? totalPoint;
  // int? spot;

  StatisticTaskModel({
    this.date,
    // this.title,
    this.totalPoint,
    // this.spot,
  });

  factory StatisticTaskModel.fromJson(Map<String, dynamic> json) =>
      StatisticTaskModel(
        date: DateTime.parse(json["date"]),
        // title: json["title"],
        totalPoint: json["total_point"],
        // spot: json["spot"],
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        // "title": title,
        "total_point": totalPoint,
        // "spot": spot,
      };
}
