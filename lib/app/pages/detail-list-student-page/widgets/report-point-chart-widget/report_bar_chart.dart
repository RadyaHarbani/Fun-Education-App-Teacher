import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/detail_list_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/widgets/report-point-chart-widget/touched_report_bar_chart.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/widgets/transaction-history-chart-widget/transaction_titles_chart.dart';
import 'package:get/get.dart';

class ReportBarChart {
  final DetailListStudentPageController detailListStudentPageController =
      Get.put(DetailListStudentPageController());
  final TransactionTitleChart transactionTitleChart = TransactionTitleChart();
  final TouchedReportBarChart touchedReportBarChart = TouchedReportBarChart();

  BarChartData mingguanBar(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    return BarChartData(
      alignment: BarChartAlignment.spaceAround,
      barTouchData: touchedReportBarChart.getBarTouchData(
        true,
        detailListStudentPageController.touchedIndexReportChart,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: transactionTitleChart.weeklyTitles,
              reservedSize: width * 0.07),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(show: false),
      barGroups: detailListStudentPageController.weeklyDataReport(),
      gridData: const FlGridData(show: false),
    );
  }

  BarChartData bulananBar(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    return BarChartData(
      alignment: BarChartAlignment.spaceAround,
      barTouchData: touchedReportBarChart.getBarTouchData(
        false,
        detailListStudentPageController.touchedIndexReportChart,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: transactionTitleChart.monthlyTitles,
            reservedSize: width * 0.12,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(show: false),
      barGroups: detailListStudentPageController.monthlyDataReport(),
      gridData: const FlGridData(show: false),
    );
  }
}
