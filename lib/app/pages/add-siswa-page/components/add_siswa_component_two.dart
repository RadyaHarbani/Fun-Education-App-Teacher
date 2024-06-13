import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_text_field.dart';
import 'package:fun_education_app_teacher/app/global-component/common_warning.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class AddSiswaComponentTwo extends StatelessWidget {
  const AddSiswaComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Login Aplikasi Siswa', style: tsBodyLargeRegular(blackColor)),
        SizedBox(height: 20),
        CommonWarning(
            backColor: Colors.amber,
            icon: Icons.info_outline,
            text: 'Buatkan Kata sandi untuk siswa agar bisa login aplikasi'),
        SizedBox(height: 10),
        CommonTextField(obscureText: false, hintText: 'Kata Sandi'),
      ],
    );
  }
}
