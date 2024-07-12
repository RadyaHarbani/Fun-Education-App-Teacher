import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/components/bottomsheet_select_period_all_points.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/detail_list_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/widgets/report-point-chart-widget/report_titles_chart.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/widgets/transaction-history-chart-widget/transaction_titles_chart.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class StatisticPageComponentTwo
    extends GetView<DetailListStudentPageController> {
  final TransactionTitleChart transactionTitleChart = TransactionTitleChart();
  final ReportTitlesChart reportTitlesChart = ReportTitlesChart();
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/icStatistic.svg'),
                SizedBox(width: width * 0.02),
                AutoSizeText.rich(
                  TextSpan(
                    text: 'Point Keseluruhan',
                    style: tsBodyMediumSemibold(blackColor),
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: whiteColor,
                  builder: (context) => BottomsheetSelectPeriodAllPoints(),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.01,
                    horizontal: width * 0.05,
                  ),
                  child: Row(
                    children: [
                      Obx(() => AutoSizeText(
                            controller.selectedAllPoints.value.toString(),
                            group: AutoSizeGroup(),
                            maxLines: 1,
                            style: tsBodySmallSemibold(blackColor),
                          )),
                      SizedBox(width: width * 0.01),
                      Icon(
                        Icons.arrow_drop_down_rounded,
                        size: 25,
                        color: blackColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.03),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.025,
          ),
          decoration: BoxDecoration(
            color: greyColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Obx(
                () {
                  return AutoSizeText.rich(
                    maxLines: 2,
                    group: AutoSizeGroup(),
                    TextSpan(
                      text: '${controller.selectedAllPoints.value}\n',
                      style: tsBodyMediumSemibold(blackColor)
                          .copyWith(height: 1.5),
                      children: [
                        TextSpan(
                          text: 'Perkembangan point ananda',
                          style: tsBodySmallRegular(blackColor),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: height * 0.02),
              Row(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: blackColor,
                      ),
                      SizedBox(width: width * 0.02),
                      AutoSizeText(
                        group: AutoSizeGroup(),
                        maxLines: 1,
                        'Point Tugas',
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                  SizedBox(width: width * 0.04),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: primaryColor,
                      ),
                      SizedBox(width: width * 0.02),
                      AutoSizeText(
                        group: AutoSizeGroup(),
                        maxLines: 1,
                        'Point Laporan',
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: height * 0.03),
              Obx(
                () {
                  return AspectRatio(
                    aspectRatio: 1.3,
                    child: BarChart(
                      BarChartData(
                        alignment: BarChartAlignment.spaceAround,
                        maxY: 2000,
                        barTouchData: BarTouchData(
                            touchTooltipData: BarTouchTooltipData(
                          getTooltipColor: (_) => blackColor.withOpacity(0.9),
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            reportTitlesChart.getWeekDay(
                              group.x.toInt(),
                            );

                            String reportPoints =
                                group.barRods[0].toY.toInt().toString();
                            String taskPoints = (group.barRods[1].toY -
                                    0.2 -
                                    group.barRods[0].toY)
                                .toInt()
                                .toString();

                            return BarTooltipItem(
                              '${controller.selectedAllPoints.value == 'Mingguan' ? reportTitlesChart.getWeekDay(group.x.toInt()) : reportTitlesChart.getWeekNumber(group.x.toInt())}\n',
                              tsBodySmallSemibold(whiteColor),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Tugas: $taskPoints\n',
                                  style: tsBodySmallSemibold(successColor),
                                ),
                                TextSpan(
                                  text: 'Laporan: $reportPoints',
                                  style: tsBodySmallSemibold(dangerColor),
                                ),
                              ],
                            );
                          },
                        )),
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
                              reservedSize:
                                  controller.selectedAllPoints.value ==
                                          'Mingguan'
                                      ? width * 0.07
                                      : width * 0.12,
                              getTitlesWidget:
                                  controller.selectedAllPoints.value ==
                                          'Mingguan'
                                      ? transactionTitleChart.weeklyTitles
                                      : transactionTitleChart.monthlyTitles,
                            ),
                          ),
                          leftTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                        ),
                        borderData: FlBorderData(show: false),
                        barGroups:
                            controller.selectedAllPoints.value == 'Mingguan'
                                ? controller.mingguanData
                                : controller.bulananData,
                        gridData: const FlGridData(show: false),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
