import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/add-student-page/add_student_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/add-student-page/components/add_student_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/add-student-page/components/add_student_page_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/add-student-page/components/add_student_page_component_two.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class AddStudentPageView extends GetView<AddStudentPageController> {
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
          'Tambah Siswa',
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
                AddStudentPageComponentOne(),
                SizedBox(height: height * 0.02),
                AddStudentComponentTwo(),
                SizedBox(height: height * 0.02),
                AddStudentComponentThree(),
                SizedBox(height: height * 0.025),
                CommonButton(
                  text: 'Tambah Siswa',
                  backgroundColor: blackColor,
                  textColor: whiteColor,
                  icon: Icons.add,
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
