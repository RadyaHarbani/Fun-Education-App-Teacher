import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_alert_dialog.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/components/detail_report_page_component_four.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/components/detail_report_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/components/detail_report_page_component_permission.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/components/detail_report_page_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/components/detail_report_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/detail_report_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

class DetailReportPageView extends GetView<DetailReportPageController> {
  const DetailReportPageView({super.key});

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
          'Detail Laporan',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () async {
          await controller.showByUserId(
            controller.userId.value,
            DateFormat('yyyy-MM-dd').format(controller.userDate),
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
        child: Obx(() {
          if (controller.isLoadingDetailReport.value) {
            return Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: height * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: width * 0.7,
                        height: height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Container(
                        width: width,
                        height: height * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Container(
                        width: width,
                        height: height * 0.08,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Container(
                        width: width,
                        height: height * 0.6,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Container(
                        width: width,
                        height: height * 0.06,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (controller.userPermission.value == 'Hadir') {
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DetailReportPageComponentOne(),
                    SizedBox(height: height * 0.02),
                    DetailReportPageComponentTwo(),
                    SizedBox(height: height * 0.02),
                    DetailReportPageComponentThree(),
                    SizedBox(height: height * 0.02),
                    DetailReportPageComponentFour(),
                    SizedBox(height: height * 0.03),
                    CommonButton(
                      text: 'Edit Laporan',
                      backgroundColor: greyColor.withOpacity(0.1),
                      textColor: blackColor,
                      onPressed: () {
                        Get.toNamed(
                          Routes.EDIT_REPORT_PAGE,
                          arguments: {
                            'userId': controller.userId.value,
                            'userFullName': controller.userFullName.value,
                            'userGrade': controller.showGradeModel,
                            'userNote': controller.userNote.value,
                            'userDate': controller.userDate,
                            'userPermission': controller.userPermission.value,
                            'userShift': controller.incomingShift.value,
                          },
                        );
                      },
                    ),
                    SizedBox(height: height * 0.01),
                    CommonButton(
                      text: 'Hapus Laporan',
                      backgroundColor: dangerColor,
                      textColor: whiteColor,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CommonAlertDialog(
                              title: 'Konfirmasi',
                              content:
                                  'Apakah anda yakin untuk mengahapus laporan',
                              cancelButtonText: 'Tidak',
                              confirmButtonText: 'Iya',
                              onConfirm: () {
                                Get.back();
                                controller.deleteDailyReportByAdmin();
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else {
            return DetailReportPageComponentPermission(
              permission: controller.userPermission.value,
            );
          }
        }),
      ),
    );
  }
}
