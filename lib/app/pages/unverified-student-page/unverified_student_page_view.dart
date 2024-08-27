import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_warning.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/components/unverified_student_page_component_five.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/components/unverified_student_page_component_four.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/components/unverified_student_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/components/unverified_student_page_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/components/unverified_student_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/unverified-student-page/unverified_student_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UnverifiedStudentPageView
    extends GetView<UnverifiedStudentPageController> {
  const UnverifiedStudentPageView({super.key});

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
          'List Pengajuan Akun',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () async {
          await controller.showAllUserByIncomingShiftOne('08.00 - 10.00');
          await controller.showAllUserByIncomingShiftTwo('10.00 - 11.30');
          await controller.showAllUserByIncomingShiftThree('11.30 - 13.00');
          await controller.showAllUserByIncomingShiftFour('13.00 - 14.00');
          await controller.showAllUserByIncomingShiftFive('14.00 - 15.00');
          controller.refreshController.refreshCompleted();
        },
        header: WaterDropHeader(
          complete: Text(
            'Refresh Completed',
            style: tsBodySmallRegular(blackColor),
          ),
          waterDropColor: primaryColor,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWarning(
                  backColor: warningColor,
                  text:
                      'Cek detail siswa untuk melihat informasi secara keseluruhan',
                ),
                SizedBox(height: height * 0.02),
                UnverifiedStudentPageComponentOne(),
                SizedBox(height: height * 0.02),
                UnverifiedStudentPageComponentTwo(),
                SizedBox(height: height * 0.02),
                UnverifiedStudentPageComponentThree(),
                SizedBox(height: height * 0.02),
                UnverifiedStudentPageComponentFour(),
                SizedBox(height: height * 0.02),
                UnverifiedStudentPageComponentFive(),
                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
