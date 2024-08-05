import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/components/report_history_page_component_four.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/components/report_history_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/components/report_history_page_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/components/report_history_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/report_history_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

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
              TableCalendar(
                rowHeight: height * 0.06,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  titleTextStyle: tsBodyMediumSemibold(blackColor),
                  leftChevronIcon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 15,
                  ),
                  rightChevronIcon: Container(
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 15,
                    ),
                  ),
                  headerPadding: EdgeInsets.only(
                    top: height * 0.02,
                    bottom: height * 0.03,
                  ),
                ),
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2013, 10, 16),
                lastDay: DateTime.utc(3000, 3, 14),
              ),
              SizedBox(height: height * 0.02),
              ReportHistoryPageComponentOne(),
              SizedBox(height: height * 0.02),
              ReportHistoryPageComponentTwo(),
              SizedBox(height: height * 0.02),
              ReportHistoryPageComponentThree(),
              SizedBox(height: height * 0.02),
              ReportHistoryPageComponentFour(),
              SizedBox(height: height * 0.03),
              CommonButton(
                text: 'Hapus Laporan',
                backgroundColor: dangerColor,
                textColor: whiteColor,
                onPressed: () {
                  // controller.deleteDailyReportByAdmin();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
