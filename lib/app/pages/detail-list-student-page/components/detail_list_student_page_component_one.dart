import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/detail_list_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/items/information-page/information_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/detail-list-student-page/items/information-page/information_page_component_two.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailListStudentPageComponentOne extends StatelessWidget {
  const DetailListStudentPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InformationPageComponentOne(),
        SizedBox(height: height * 0.04),
        InformationPageComponentTwo(),
        SizedBox(height: height * 0.02),
        CommonButton(
          text: 'Hapus Data Siswa',
          backgroundColor: dangerColor,
          textColor: whiteColor,
          icon: Icons.delete_rounded,
          onPressed: () {},
        ),
      ],
    );
  }
}
