import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/detail_list_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/widgets/report-point-chart-widget/report_titles_chart.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class TouchedReportBarChart {
  final ReportTitlesChart reportTitlesChart = ReportTitlesChart();
  final DetailListStudentPageController detailListStudentPageController =
      Get.put(DetailListStudentPageController());
  BarTouchData getBarTouchData(bool isWeekly, RxInt touchedIndexReportChart) {
    return BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        getTooltipColor: (_) => greyColor.withOpacity(0.7),
        tooltipHorizontalAlignment: FLHorizontalAlignment.center,
        tooltipMargin: -10,
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          String weekDay = isWeekly
              ? reportTitlesChart.getWeekDay(group.x)
              : reportTitlesChart.getWeekNumber(group.x);
          return BarTooltipItem(
            '$weekDay\n',
            tsBodySmallSemibold(whiteColor),
            children: <TextSpan>[
              TextSpan(
                text: (rod.toY - 1).toString(),
                style: tsBodySmallBold(whiteColor),
              ),
            ],
          );
        },
      ),
      touchCallback: (FlTouchEvent event, barTouchResponse) {
        if (!event.isInterestedForInteractions ||
            barTouchResponse == null ||
            barTouchResponse.spot == null) {
          detailListStudentPageController.touchedIndexReportChart.value = -1;
          return;
        }
        detailListStudentPageController.touchedIndexReportChart.value =
            barTouchResponse.spot!.touchedBarGroupIndex;
      },
    );
  }
}
