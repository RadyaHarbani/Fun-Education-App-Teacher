import 'dart:io';
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
              height: controller.fileimagePath.value.isNotEmpty ? 200 : 50,
              decoration: BoxDecoration(
                  color: greyColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(10),
                  image: controller.fileimagePath.value.isNotEmpty
                      ? DecorationImage(
                          image:
                              FileImage(File(controller.fileimagePath.value)),
                          fit: BoxFit.cover)
                      : null),
              child: controller.fileimagePath.value.isNotEmpty
                  ? null
                  : Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.add, color: blackColor, size: 20),
                          const SizedBox(
                            width: 10,
                          ),
                          Text("Tambah Gambar",
                              style: tsBodyMediumRegular(blackColor))
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
