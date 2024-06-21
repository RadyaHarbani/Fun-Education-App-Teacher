import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_text_field.dart';
import 'package:fun_education_app_teacher/app/pages/add-student-page/add_student_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class AddStudentPageComponentOne extends GetView<AddStudentPageController> {
  const AddStudentPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Data Diri Siswa', style: tsBodyLargeRegular(blackColor)),
        SizedBox(height: height * 0.02),
        CommonTextField(
          obscureText: false,
          hintText: "Nama Lengkap",
          fieldController: controller.namaLengkapController,
        ),
        SizedBox(height: height * 0.01),
        CommonTextField(
          obscureText: false,
          hintText: "Nama Panggilan",
          fieldController: controller.namaLengkapController,
        ),
        SizedBox(height: height * 0.01),
        CommonTextField(
          obscureText: false,
          hintText: "Jenis Kelamain",
          fieldController: controller.namaLengkapController,
        ),
        SizedBox(height: height * 0.01),
        CommonTextField(
            obscureText: false,
            hintText: 'Tempat, Tanggal Lahir',
            fieldController: controller.tempatLahirController),
        SizedBox(height: height * 0.01),
        CommonTextField(
            obscureText: false,
            hintText: 'Alamat Lengkap',
            fieldController: controller.alamatLengkapController),
      ],
    );
  }
}
