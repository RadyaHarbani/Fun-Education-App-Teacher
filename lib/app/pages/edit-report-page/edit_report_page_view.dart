import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/edit-report-page/components/edit_report_page_component_four.dart';
import 'package:fun_education_app_teacher/app/pages/edit-report-page/components/edit_report_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/edit-report-page/components/edit_report_page_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/edit-report-page/components/edit_report_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/edit-report-page/edit_report_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class EditReportPageView extends GetView<EditReportPageController> {
  const EditReportPageView({super.key});

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
          'Edit Laporan',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditReportPageComponentOne(),
              SizedBox(height: height * 0.02),
              EditReportPageComponentTwo(),
              SizedBox(height: height * 0.04),
              EditReportPageComponentThree(),
              SizedBox(height: height * 0.01),
              EditReportPageComponentFour(),
              SizedBox(height: height * 0.06),
              CommonButton(
                text: 'Simpan Perubahan',
                backgroundColor: blackColor,
                textColor: whiteColor,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
