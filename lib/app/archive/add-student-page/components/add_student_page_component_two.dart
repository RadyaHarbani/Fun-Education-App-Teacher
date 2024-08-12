import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_text_field.dart';
import 'package:fun_education_app_teacher/app/global-component/common_warning.dart';
import 'package:fun_education_app_teacher/app/archive/add-student-page/add_student_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class AddStudentComponentTwo extends GetView<AddStudentPageController> {
  const AddStudentComponentTwo({super.key});

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
            text: 'Buatkan Kata sandi untuk siswa agar bisa login aplikasi'),
        SizedBox(height: height * 0.01),
        Obx(
          () => CommonTextField(
            obscureText: controller.isObsecure.value,
            hintText: 'Kata Sandi',
            keyboardType: TextInputType.name,
            fieldController: controller.passwordStudentController,
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
