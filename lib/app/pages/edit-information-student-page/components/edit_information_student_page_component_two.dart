import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_text_field.dart';
import 'package:fun_education_app_teacher/app/global-component/common_warning.dart';
import 'package:fun_education_app_teacher/app/pages/edit-information-student-page/edit_information_student_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class EditInformationStudentPageComponentTwo
    extends GetView<EditInformationStudentPageController> {
  const EditInformationStudentPageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login Aplikasi Siswa',
          style: tsBodyLargeRegular(blackColor),
        ),
        SizedBox(height: height * 0.02),
        CommonWarning(
          backColor: warningColor,
          text: 'Jangan Lupa Memberi Tahu Perubahannya yaa...',
        ),
        SizedBox(height: height * 0.01),
        Obx(
          () => CommonTextField(
            obscureText: controller.isObsecure.value,
            hintText: 'Kata Sandi',
            keyboardType: TextInputType.name,
            suffixIcon: IconButton(
              onPressed: () {
                controller.isObsecure.value = !controller.isObsecure.value;
              },
              icon: Icon(
                controller.isObsecure.value
                    ? Icons.visibility_off
                    : Icons.visibility,
                size: 20,
                color: greyColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
