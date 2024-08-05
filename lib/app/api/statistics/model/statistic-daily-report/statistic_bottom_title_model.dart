class StatisticBottomTitleModel {
    String? date;
    int? bottomTitleCase;

    StatisticBottomTitleModel({
        this.date,
        this.bottomTitleCase,
    });

    factory StatisticBottomTitleModel.fromJson(Map<String, dynamic> json) => StatisticBottomTitleModel(
        date: json["date"],
        bottomTitleCase: json["case"],
    );

    Map<String, dynamic> toJson() => {
        "date": date,
        "case": bottomTitleCase,
    };
}