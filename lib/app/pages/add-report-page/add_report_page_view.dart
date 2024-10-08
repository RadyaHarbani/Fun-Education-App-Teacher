import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/add_report_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/components/add_report_page_component_five.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/components/add_report_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/components/add_report_page_component_four.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/components/add_report_page_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/components/add_report_page_component_two.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AddReportPageView extends GetView<AddReportPageController> {
  const AddReportPageView({super.key});
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
          'Buat Laporan',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () async {
          await controller.showUserDoneUndone(
            'false',
            Get.arguments['incomingShift'],
            Get.arguments['selectedDate'],
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
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddReportPageComponentOne(),
                SizedBox(height: height * 0.03),
                AddReportPageComponentTwo(),
                SizedBox(height: height * 0.03),
                Obx(() => AnimatedSize(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: controller.selectedPermission.value == 'Hadir'
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AddReportPageComponentThree(),
                                SizedBox(height: height * 0.02),
                              ],
                            )
                          : SizedBox.shrink(),
                    )),
                AddReportPageComponentFour(),
                SizedBox(height: height * 0.03),
                AddReportPageComponentFive(),
                SizedBox(height: height * 0.05),
                Obx(() => CommonButton(
                      isLoading: controller.isLoadingAddReport.value,
                      text: 'Kirim Laporan',
                      backgroundColor: blackColor,
                      textColor: whiteColor,
                      onPressed: () {
                        controller.storeDailyReportByAdmin();
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
