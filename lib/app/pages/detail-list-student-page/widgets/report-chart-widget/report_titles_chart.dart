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
      default:
        return Container();
    }

    return Text(
      text,
      style: style,
      textAlign: TextAlign.left,
    );
  }

  Widget bottomTitleWidgets5Data(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = detailListStudentPageController.bottomTitles[0];
        break;
      case 1:
        text = detailListStudentPageController.bottomTitles[1];
        break;
      case 2:
        text = detailListStudentPageController.bottomTitles[2];
        break;
      case 3:
        text = detailListStudentPageController.bottomTitles[3];
        break;
      case 4:
        text = detailListStudentPageController.bottomTitles[4];

      default:
        text = '';
        break;
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

  Widget bottomTitleWidgets15Data(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 1:
        text = detailListStudentPageController.bottomTitles[0];
        break;
      case 4:
        text = detailListStudentPageController.bottomTitles[1];
        break;
      case 7:
        text = detailListStudentPageController.bottomTitles[2];
        break;
      case 10:
        text = detailListStudentPageController.bottomTitles[3];
        break;
      case 13:
        text = detailListStudentPageController.bottomTitles[4];

      default:
        text = '';
        break;
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

  Widget bottomTitleWidgets30Data(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 1:
        text = detailListStudentPageController.bottomTitles[0];
        break;
      case 7:
        text = detailListStudentPageController.bottomTitles[1];
        break;
      case 13:
        text = detailListStudentPageController.bottomTitles[2];
        break;
      case 19:
        text = detailListStudentPageController.bottomTitles[3];
        break;
      case 25:
        text = detailListStudentPageController.bottomTitles[4];

      default:
        text = '';
        break;
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
