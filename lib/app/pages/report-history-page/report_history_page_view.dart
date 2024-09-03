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
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

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
      body: Obx(() {
        return SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () async {
            controller.showByUserId(
              controller.userId.value,
              controller.selectedDay.value.toString(),
            );
            controller.refreshController.refreshCompleted();
          },
          header: WaterDropHeader(
            complete: Text(
              'Refresh Completed',
              style: tsBodySmallRegular(blackColor),
            ),
            waterDropColor: primaryColor,
          ),
          child: SingleChildScrollView(
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
                  controller.isLoadingReportHistory.value
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Container(
                                height: height * 0.25,
                                width: width,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              );
                            },
                          ),
                        )
                      : Obx(() {
                          if (controller.showGradeModel.isNotEmpty &&
                              controller.userPermission.value == 'Hadir') {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(
                                  Routes.DETAIL_REPORT_PAGE,
                                  arguments: {
                                    'userIdHistory': controller.userId.value,
                                    'userFullNameHistory':
                                        controller.userName.value,
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
                              controller.userPermission.isNotEmpty) {
                            return ReportHistoryPermissionItem(
                              permission: controller.userPermission.value,
                              selectedDate: controller.selectedDay.value,
                              note: controller.userNote.value,
                              onTap: () {
                                Get.toNamed(
                                  Routes.DETAIL_REPORT_PAGE,
                                  arguments: {
                                    'userIdHistory': controller.userId.value,
                                    'userFullNameHistory':
                                        controller.userName.value,
                                    'dateHistory': controller.selectedDay.value,
                                    'incomingShiftHistory':
                                        controller.incomingShift.value,
                                  },
                                );
                              },
                            );
                          } else if (controller.userPermission.isEmpty &&
                              controller.showGradeModel.isEmpty &&
                              controller.userNote.isEmpty) {
                            return ReportHistoryEmptyItem(
                                selectedDate: controller.selectedDay.value);
                          } else {
                            return SizedBox.shrink();
                          }
                        }),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
