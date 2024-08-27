import 'package:intl/intl.dart';

class StatisticBottomTitleModel {
  DateTime? date;
  int? bottomTitleCase;

  StatisticBottomTitleModel({
    this.date,
    this.bottomTitleCase,
  });

  factory StatisticBottomTitleModel.fromJson(Map<String, dynamic> json) {
    String dateString = json["date"];
    DateTime parsedDate = DateFormat('dd-MM').parse(dateString);

    return StatisticBottomTitleModel(
      date: parsedDate,
      bottomTitleCase: json["case"],
    );
  }

  Map<String, dynamic> toJson() => {
        "date": DateFormat('dd-MM').format(date!),
        "case": bottomTitleCase,
      };
}
