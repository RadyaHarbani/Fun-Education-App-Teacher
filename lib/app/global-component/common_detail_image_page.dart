import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:image_picker/image_picker.dart';

class CommonDetailImagePage extends StatelessWidget {
  final XFile imageFile;

  CommonDetailImagePage({required this.imageFile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        backgroundColor: blackColor,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: whiteColor,
            size: 15,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: AutoSizeText(
          'Detail Gambar',
          group: AutoSizeGroup(),
          maxLines: 1,
          style: tsBodyMediumSemibold(whiteColor),
        ),
      ),
      body: Center(
        child: Image.file(
          File(imageFile.path),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
