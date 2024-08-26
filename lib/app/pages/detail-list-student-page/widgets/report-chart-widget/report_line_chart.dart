import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/detail_list_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/widgets/report-chart-widget/report_titles_chart.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReportLineChart {
  final DetailListStudentPageController detailListStudentPageController =
      Get.put(DetailListStudentPageController());
  final ReportTitleChart reportTitleChart = ReportTitleChart();

  LineChartData reportLineChart() {
    final allSpots = detailListStudentPageController.spots;
    List<LineChartBarData> lineBarsData = [];
    List<FlSpot> segment = [];

    for (int i = 0; i < allSpots.length; i++) {
      final spot = allSpots[i];
      if (spot.y != 0) {
        segment.add(spot);
      }
      if (spot.y == 0 || i == allSpots.length - 1) {
        if (segment.isNotEmpty) {
          lineBarsData.add(LineChartBarData(
            spots: segment,
            isCurved: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: successColor, end: successColor)
                    .lerp(0.1)!
                    .withOpacity(0.5),
                ColorTween(begin: successColor, end: successColor)
                    .lerp(0.1)!
                    .withOpacity(0.5),
              ],
            ),
            barWidth: 5,
            isStrokeCapRound: false,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) =>
                  FlDotCirclePainter(
                radius: 4,
                color: successColor.withOpacity(0.6),
              ),
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  ColorTween(begin: successColor, end: whiteColor)
                      .lerp(0.1)!
                      .withOpacity(0.1),
                  ColorTween(begin: successColor, end: whiteColor)
                      .lerp(0.1)!
                      .withOpacity(0.1),
                ],
              ),
            ),
          ));
          segment = [];
        }
        if (spot.y == 0) {
          lineBarsData.add(LineChartBarData(
            spots: [spot],
            isCurved: false,
            color: transparentColor,
            barWidth: 5,
            isStrokeCapRound: false,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) =>
                  FlDotCirclePainter(
                radius: 4,
                color: greyColor.withOpacity(0.15),
              ),
            ),
            belowBarData: BarAreaData(show: false),
          ));
        }
      }
    }

    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => greyColor.withOpacity(0.7),
          tooltipHorizontalAlignment: FLHorizontalAlignment.center,
          tooltipMargin: 8,
          getTooltipItems: (List<LineBarSpot> touchedSpots) {
            return touchedSpots.map((LineBarSpot touchedSpot) {
              final TextStyle textStyle = tsBodySmallSemibold(whiteColor);
              return LineTooltipItem(
                '${touchedSpot.y.toString()}\n${DateFormat('dd MMMM yyy').format(detailListStudentPageController.touchedTitle[touchedSpot.x.toInt()])}',
                textStyle,
              );
            }).toList();
          },
        ),
      ),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: false,
        drawVerticalLine: false,
        verticalInterval: 1,
        horizontalInterval: 1,
      ),
      extraLinesData: ExtraLinesData(
        horizontalLines: [
          HorizontalLine(
            y: 70,
            color: dangerColor.withOpacity(0.8),
            strokeWidth: 2,
            dashArray: [5, 5],
          ),
        ],
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget:
                detailListStudentPageController.selectedReportPoint.value ==
                        'weekly'
                    ? reportTitleChart.weeklyBottomTitle
                    : reportTitleChart.monthlyBottomTitle,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: reportTitleChart.leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: false,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: detailListStudentPageController.maxX.value,
      minY: 0,
      maxY: 100,
      lineBarsData: lineBarsData,
    );
  }
}
