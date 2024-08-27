import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/detail_list_student_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class ReportTitleChart {
  DetailListStudentPageController detailListStudentPageController =
      Get.put(DetailListStudentPageController());

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    TextStyle style = tsBodySmallRegular(blackColor);
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 20:
        text = '20';
        break;
      case 40:
        text = '40';
        break;
      case 60:
        text = '60';
        break;
      case 80:
        text = '80';
        break;
      case 100:
        text = '100';
        break;
      default:
        return Container();
    }

    return Text(
      text,
      style: style,
      textAlign: TextAlign.left,
    );
  }

  Widget weeklyBottomTitle(double value, TitleMeta meta) {
    TextStyle style = tsLabelLargeSemibold(blackColor);
    String text;
    switch (value.toInt()) {
      case 0:
        text = detailListStudentPageController.bottomTitles[0] ?? '';
        break;
      case 1:
        text = detailListStudentPageController.bottomTitles[1] ?? '';
        break;
      case 2:
        text = detailListStudentPageController.bottomTitles[2] ?? '';
        break;
      case 3:
        text = detailListStudentPageController.bottomTitles[3] ?? '';
        break;
      case 4:
        text = detailListStudentPageController.bottomTitles[4] ?? '';
        break;
      case 5:
        text = detailListStudentPageController.bottomTitles[5] ?? '';
        break;
      case 6:
        text = detailListStudentPageController.bottomTitles[6] ?? '';
        break;
      default:
        return Container();
    }

    return Text(
      text,
      style: style,
      textAlign: TextAlign.left,
    );
  }

  Widget monthlyBottomTitle(double value, TitleMeta meta) {
    TextStyle style = tsLabelLargeSemibold(blackColor);
    String text;
    switch (value.toInt()) {
      case 0:
        text =
            '${detailListStudentPageController.bottomTitlesMonthly[0]}\n Min 1';
        break;
      case 10:
        text =
            '${detailListStudentPageController.bottomTitlesMonthly[10]}\n Min 2';
        break;
      case 20:
        text =
            '${detailListStudentPageController.bottomTitlesMonthly[20]}\n Min 3';
        break;
      case 30:
        text =
            '${detailListStudentPageController.bottomTitlesMonthly[30]}\n Min 4';
        break;
      default:
        return Container();
    }

    return Text(
      text,
      style: style,
      textAlign: TextAlign.center,
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text = '';
    if (value.toInt() < detailListStudentPageController.bottomTitles.length) {
      text = detailListStudentPageController.bottomTitles[value.toInt()] ?? '';
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        text,
        style: tsLabelMediumSemibold(blackColor),
        textAlign: TextAlign.center,
      ),
    );
  }
}
