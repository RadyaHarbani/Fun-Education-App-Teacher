import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/components/report_history_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/components/report_history_page_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/components/report_history_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/report_history_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/widget/report_history_container_item.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/widget/report_history_empty_item.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/widget/report_history_permission_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
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
              SizedBox(height: height * 0.035),
              ReportHistoryPageComponentThree(),
              SizedBox(height: height * 0.02),
              Obx(() {
                if (controller.showGradeModel.isNotEmpty &&
                    controller.userPermission.value == 'Hadir') {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(
                        Routes.DETAIL_REPORT_PAGE,
                        arguments: {
                          'userIdHistory': controller.userId.value,
                          'userFullNameHistory': controller.userName.value,
                          'dateHistory': controller.selectedDay.value,
                          'incomingShiftHistory':
                              controller.incomingShift.value,
                        },
                      );
                    },
                    child: ReportHistoryContainerItem(
                      selectedDate: controller.selectedDay.value,
                      totalPoint: controller.userGrade.value,
                      note: controller.userNote.value,
                    ),
                  );
                } else if (controller.showGradeModel.isEmpty &&
                    controller.userPermission.value != 'Hadir' &&
                    controller.userGrade.value == 0) {
                  return ReportHistoryPermissionItem(
                    permission: controller.userPermission.value,
                    selectedDate: controller.selectedDay.value,
                    note: controller.userNote.value,
                    onTap: () {
                      Get.toNamed(
                        Routes.DETAIL_REPORT_PAGE,
                        arguments: {
                          'userIdHistory': controller.userId.value,
                          'userFullNameHistory': controller.userName.value,
                          'dateHistory': controller.selectedDay.value,
                          'incomingShiftHistory':
                              controller.incomingShift.value,
                        },
                      );
                    },
                  );
                } else if (controller.userPermission.isEmpty) {
                  return ReportHistoryEmptyItem(
                      selectedDate: controller.selectedDay.value);
                } else {
                  return Container();
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
