import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/components/detail_report_page_component_four.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/components/detail_report_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/components/detail_report_page_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/components/detail_report_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/detail_report_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/widgets/report_list_item.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/widgets/total_point_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
      body: SingleChildScrollView(
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
                onPressed: () {},
              ),
              SizedBox(height: height * 0.01),
              CommonButton(
                text: 'Hapus Laporan',
                backgroundColor: dangerColor,
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
