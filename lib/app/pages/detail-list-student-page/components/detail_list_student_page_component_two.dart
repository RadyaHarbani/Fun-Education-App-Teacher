import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/detail_list_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/items/statistic-page/statistic_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/items/statistic-page/statistic_page_component_two.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class DetailListStudentPageComponentTwo
    extends GetView<DetailListStudentPageController> {
  const DetailListStudentPageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatisticPageComponentOne(),
          SizedBox(height: height * 0.05),
          StatisticPageComponentTwo(),
          SizedBox(height: height * 0.05),
          CommonButton(
            text: 'Lihat Riwayat Laporan',
            backgroundColor: blackColor,
            textColor: whiteColor,
            icon: Icons.arrow_forward_ios_rounded,
            onPressed: () {
              Get.toNamed(
                Routes.REPORT_HISTORY_PAGE,
                arguments: {
                  'userId': controller.detailInformationUser.value.id,
                  'userName': controller.detailInformationUser.value.fullName,
                  'incomingShift': controller.detailInformationUser.value.shift,
                },
              );
            },
          ),
          SizedBox(height: height * 0.05),
        ],
      ),
    );
  }
}
