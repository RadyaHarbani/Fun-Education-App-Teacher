import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/transaction_history_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/transaction-history-page/widgets/transaction-history-chart-widget/transaction_titles_chart.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class TransactionBarChart extends GetView<TransactionHistoryPageController> {
  const TransactionBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.05,
        vertical: height * 0.025,
      ),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () {
              return AutoSizeText.rich(
                maxLines: 2,
                group: AutoSizeGroup(),
                TextSpan(
                  text: '${controller.selectedPeriod.value}\n',
                  style: tsBodyMediumSemibold(blackColor).copyWith(height: 1.5),
                  children: [
                    TextSpan(
                        text: 'Riwayat Transaksi Ananda',
                        style: tsBodySmallRegular(blackColor)),
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
                    backgroundColor: successColor,
                  ),
                  SizedBox(width: width * 0.02),
                  AutoSizeText(
                    group: AutoSizeGroup(),
                    maxLines: 1,
                    'Pemasukan',
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
                    backgroundColor: dangerColor,
                  ),
                  SizedBox(width: width * 0.02),
                  AutoSizeText(
                    group: AutoSizeGroup(),
                    maxLines: 1,
                    'Pengeluaran',
                    style: tsBodySmallRegular(blackColor),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: height * 0.03),
          AspectRatio(
            aspectRatio: 1.3,
            child: Obx(
              () {
                return BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 1000000,
                    gridData: FlGridData(
                      show: false,
                    ),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: width * 0.13,
                          getTitlesWidget: (value, meta) {
                            return controller.transactionLimitValue(value);
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 42, // Add margin to push the text up
                          getTitlesWidget:
                              controller.selectedPeriod.value == 'Mingguan'
                                  ? TransactionTitleChart().mingguanTitles
                                  : TransactionTitleChart().bulananTitles,
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: controller.selectedPeriod.value == 'Mingguan'
                        ? controller.mingguanData
                        : controller.bulananData,
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipColor: (_) => blackColor.withOpacity(0.9),
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          String pengeluaranValue =
                              group.barRods[0].toY.toInt().toString();
                          String pemasukanValue =
                              group.barRods[1].toY.toInt().toString();

                          return BarTooltipItem(
                            '${controller.selectedPeriod.value == 'Mingguan' ? controller.getWeekDay(group.x.toInt()) : controller.getWeekNumber(group.x.toInt())}\n',
                            tsBodySmallSemibold(whiteColor),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Pengeluaran : $pengeluaranValue\n',
                                style: tsBodySmallSemibold(dangerColor),
                              ),
                              TextSpan(
                                text: 'Pemasukan : $pemasukanValue',
                                style: tsBodySmallSemibold(successColor),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
