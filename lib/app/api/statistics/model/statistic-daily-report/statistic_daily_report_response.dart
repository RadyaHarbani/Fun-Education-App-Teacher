// To parse this JSON data, do
//
//     final statisticDailyReportResponse = statisticDailyReportResponseFromJson(jsonString);

import 'dart:convert';

import 'package:fun_education_app_teacher/app/api/statistics/model/statistic-daily-report/statistic_bottom_title_model.dart';
import 'package:fun_education_app_teacher/app/api/statistics/model/statistic-daily-report/statistic_daily_report_model.dart';

StatisticDailyReportResponse statisticDailyReportResponseFromJson(String str) => StatisticDailyReportResponse.fromJson(json.decode(str));

String statisticDailyReportResponseToJson(StatisticDailyReportResponse data) => json.encode(data.toJson());

class StatisticDailyReportResponse {
    int totalData;
    List<StatisticDailyReportModel> data;
    List<StatisticBottomTitleModel> bottomTitle;

    StatisticDailyReportResponse({
        required this.totalData,
        required this.data,
        required this.bottomTitle,
    });

    factory StatisticDailyReportResponse.fromJson(Map<String, dynamic> json) => StatisticDailyReportResponse(
        totalData: json["total_data"],
        data: List<StatisticDailyReportModel>.from(json["data"].map((x) => StatisticDailyReportModel.fromJson(x))),
        bottomTitle: List<StatisticBottomTitleModel>.from(json["bottom_title"].map((x) => StatisticBottomTitleModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total_data": totalData,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "bottom_title": List<dynamic>.from(bottomTitle.map((x) => x.toJson())),
    };
}