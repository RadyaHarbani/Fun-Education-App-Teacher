class StatisticDailyReportModel {
    DateTime? date;
    int? totalPoint;
    int? spot;

    StatisticDailyReportModel({
        this.date,
        this.totalPoint,
        this.spot,
    });

    factory StatisticDailyReportModel.fromJson(Map<String, dynamic> json) => StatisticDailyReportModel(
        date: DateTime.parse(json["date"]),
        totalPoint: json["total_point"],
        spot: json["spot"],
    );

    Map<String, dynamic> toJson() => {
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "total_point": totalPoint,
        "spot": spot,
    };
}