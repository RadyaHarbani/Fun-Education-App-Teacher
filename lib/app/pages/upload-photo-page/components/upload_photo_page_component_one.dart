import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_multiline_text_field.dart';
import 'package:fun_education_app_teacher/app/global-component/common_text_field.dart';
import 'package:fun_education_app_teacher/app/pages/upload-photo-page/upload_photo_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class UploadPhotoPageComponentOne extends GetView<UploadPhotoPageController> {
  const UploadPhotoPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Judul & Deskripsi',
          style: tsBodyLargeRegular(blackColor),
        ),
        SizedBox(height: height * 0.02),
        CommonTextField(
          obscureText: false,
          hintText: "Judul Foto",
          fieldController: controller.photoTitleController,
        ),
        SizedBox(height: height * 0.01),
        CommonMultilineTextfield(
          maxlines: 5,
          hintText: 'Deskripsi Foto',
          onChanged: (value) {},
          controller: controller.photoDescriptionController,
        ),
      ],
    );
  }
}
