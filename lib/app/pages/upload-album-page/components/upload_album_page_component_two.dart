import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/upload-album-page/upload_album_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class UploadAlbumPageComponentTwo extends GetView<UploadAlbumPageController> {
  const UploadAlbumPageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    final double width = mediaQuery.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Sampul Album',
          style: tsBodyLargeRegular(blackColor),
        ),
        SizedBox(height: height * 0.02),
        InkWell(
          onTap: () {
            controller.selectOneImage();
          },
          child: Obx(
            () => Container(
              height: controller.fileimagePath.value.isNotEmpty
                  ? height * 0.2
                  : height * 0.07,
              decoration: BoxDecoration(
                color: greyColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
                image: controller.fileimagePath.value.isNotEmpty
                    ? DecorationImage(
                        image: FileImage(File(controller.fileimagePath.value)),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: controller.fileimagePath.value.isNotEmpty
                  ? null
                  : Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            "Tambah Gambar",
                            style: tsBodySmallSemibold(blackColor),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Icon(
                            Icons.photo_rounded,
                            color: blackColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
