import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/components/report_history_page_component_five.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/components/report_history_page_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/components/report_history_page_component_four.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/components/report_history_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/components/report_history_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/report_history_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class ReportHistoryPageView extends GetView<ReportHistoryPageController> {
  const ReportHistoryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Riwayat Laporan',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: width * 0.05,
            right: width * 0.05,
            bottom: height * 0.04,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.02),
              ReportHistoryPageComponentOne(),
              SizedBox(height: height * 0.015),
              ReportHistoryPageComponentTwo(),
              SizedBox(height: height * 0.05),
              ReportHistoryPageComponentThree(),
              SizedBox(height: height * 0.02),
              ReportHistoryPageComponentFour(),
              SizedBox(height: height * 0.02),
              ReportHistoryPageComponentFive(),
              SizedBox(height: height * 0.03),
              CommonButton(
                text: 'Hapus Laporan',
                backgroundColor: dangerColor,
                textColor: whiteColor,
                onPressed: () {
                  controller.deleteDailyReportByAdmin();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
