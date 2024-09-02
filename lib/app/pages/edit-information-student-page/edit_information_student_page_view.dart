import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/edit-information-student-page/components/edit_information_student_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/edit-information-student-page/components/edit_information_student_page_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/edit-information-student-page/components/edit_information_student_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/edit-information-student-page/edit_information_student_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class EditInformationStudentPageView
    extends GetView<EditInformationStudentPageController> {
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
          icon: const Icon(
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText.rich(
                      group: AutoSizeGroup(),
                      maxLines: 2,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Status Kelulusan\n',
                            style: tsBodyLargeRegular(blackColor).copyWith(
                              height: 1.3,
                            ),
                          ),
                          TextSpan(
                            text:
                                '*pastikan siswa sudah di tahap akhir belajar',
                            style: tsBodySmallRegular(dangerColor),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Obx(
                      () => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            'Sudah Lulus :',
                            style: tsBodyMediumRegular(blackColor),
                          ),
                          Switch(
                            activeColor: primaryColor,
                            activeTrackColor: primaryColor.withOpacity(0.3),
                            value: controller.isGraduated.value,
                            onChanged: controller.learningFlow.value == 'C'
                                ? (bool value) {
                                    controller.isGraduated.value = value;
                                    print(controller.isGraduated.value);
                                  }
                                : null,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.03),
                Obx(
                  () => CommonButton(
                    isLoading: controller.isLoadingEditInformationStudent.value,
                    text: 'Simpan Perubahan',
                    backgroundColor: blackColor,
                    textColor: whiteColor,
                    onPressed: () {
                      controller.updateUserByAdmin();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
