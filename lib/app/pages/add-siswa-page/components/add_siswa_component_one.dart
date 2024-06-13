import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_text_field.dart';
import 'package:fun_education_app_teacher/app/pages/add-siswa-page/add_siswa_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class AddSiswaComponentOne extends GetView<AddSiswaPageController> {
  const AddSiswaComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Data Diri Siswa', style: tsBodyLargeRegular(blackColor)),
        SizedBox(height: 20),
        CommonTextField(
          obscureText: false,
          hintText: "Nama Lengkap",
          fieldController: controller.namaLengkapController,
        ),
        SizedBox(height: 10),
        CommonTextField(
            obscureText: false,
            hintText: 'Tempat, Tanggal Lahir',
            fieldController: controller.tempatLahirController),
        SizedBox(height: 10),
        CommonTextField(
            obscureText: false,
            hintText: 'Alamat Lengkap',
            fieldController: controller.alamatLengkapController),
      ],
    );
  }
}
