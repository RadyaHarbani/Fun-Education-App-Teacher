import 'package:auto_size_text/auto_size_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/components/bottomsheet_select_period_task_points.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/detail_list_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/widgets/task-chart-widget/task_line_chart.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class StatisticPageComponentTwo
    extends GetView<DetailListStudentPageController> {
  final TaskLineChart taskLineChart = TaskLineChart();

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
                    text: 'Point Tugas',
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
                  builder: (context) => BottomsheetSelectPeriodTaskPoints(),
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
                            // '${controller.selectedTaskPoints.value.toString()} Tugas',
                            controller.selectedTaskPoints.value == 'weekly'
                                ? 'Mingguan'
                                : 'Bulanan',
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
        SizedBox(height: height * 0.02),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.025,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: greyColor.withOpacity(0.05),
          ),
          child: AspectRatio(
            aspectRatio: 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(() {
                  return AutoSizeText.rich(
                    TextSpan(
                      // text:
                      //     '${controller.selectedTaskPoints.value} Tugas (Terakhir)\n',
                      text: controller.selectedTaskPoints.value == 'weekly'
                          ? 'Mingguan (Terakhir)\n'
                          : 'Bulanan (Terakhir)\n',
                      style: tsBodyMediumSemibold(blackColor)
                          .copyWith(height: 1.5),
                      children: [
                        TextSpan(
                          text: 'Perkembangan point ananda',
                          style: tsBodySmallRegular(blackColor),
                        ),
                      ],
                    ),
                    maxLines: 2,
                    group: AutoSizeGroup(),
                  );
                }),
                SizedBox(height: height * 0.02),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: height * 0.008,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: whiteColor,
                  ),
                  child: Row(
                    children: [
                      // Row(
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     AutoSizeText(
                      //       group: AutoSizeGroup(),
                      //       maxLines: 1,
                      //       '-',
                      //       style: tsTitleLargeSemibold(dangerColor),
                      //     ),
                      //     SizedBox(width: width * 0.02),
                      //     AutoSizeText(
                      //       group: AutoSizeGroup(),
                      //       maxLines: 1,
                      //       'Rata - Rata',
                      //       style: tsBodySmallRegular(blackColor),
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(width: width * 0.05),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 6,
                            backgroundColor: primaryColor,
                          ),
                          SizedBox(width: width * 0.02),
                          AutoSizeText(
                            group: AutoSizeGroup(),
                            maxLines: 1,
                            'Point Tugas',
                            style: tsBodySmallRegular(blackColor),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: height * 0.04),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.01,
                    ),
                    child: Obx(() => controller.bottomTitlesTask.isEmpty
                        ? Text('Tidak Ada data')
                        : LineChart(
                            taskLineChart.taskLineChart(),
                          )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
