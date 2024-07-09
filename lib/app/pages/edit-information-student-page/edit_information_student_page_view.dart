import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/edit-information-student-page/components/edit_information_student_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/edit-information-student-page/components/edit_information_student_page_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/edit-information-student-page/components/edit_information_student_page_component_two.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class EditInformationStudentPageView extends StatelessWidget {
  const EditInformationStudentPageView({super.key});

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
          'Edit Informasi Siswa',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.015,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditInformationStudentPageComponentOne(),
                SizedBox(height: height * 0.03),
                EditInformationStudentPageComponentTwo(),
                SizedBox(height: height * 0.03),
                EditInformationStudentPageComponentThree(),
                SizedBox(height: height * 0.03),
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
      ),
    );
  }
}
