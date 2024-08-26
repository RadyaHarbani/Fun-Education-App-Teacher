import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/detail_list_student_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class TaskTitleChart {
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
        text = detailListStudentPageController.bottomTitlesTask[0] ?? '';
        break;
      case 1:
        text = detailListStudentPageController.bottomTitlesTask[1] ?? '';
        break;
      case 2:
        text = detailListStudentPageController.bottomTitlesTask[2] ?? '';
        break;
      case 3:
        text = detailListStudentPageController.bottomTitlesTask[3] ?? '';
        break;
      case 4:
        text = detailListStudentPageController.bottomTitlesTask[4] ?? '';
        break;
      case 5:
        text = detailListStudentPageController.bottomTitlesTask[5] ?? '';
        break;
      case 6:
        text = detailListStudentPageController.bottomTitlesTask[6] ?? '';
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
        text = detailListStudentPageController.bottomTitlesTask[0] ?? '';
        break;
      case 10:
        text = detailListStudentPageController.bottomTitlesTask[10] ?? '';
        break;
      case 20:
        text = detailListStudentPageController.bottomTitlesTask[20] ?? '';
        break;
      case 30:
        text = detailListStudentPageController.bottomTitlesTask[30] ?? '';
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
    if (value.toInt() <
        detailListStudentPageController.bottomTitlesTask.length) {
      text =
          detailListStudentPageController.bottomTitlesTask[value.toInt()] ?? '';
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
