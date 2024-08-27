import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/upload-album-page/components/upload_album_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/upload-album-page/components/upload_album_page_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/upload-album-page/components/upload_album_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/upload-album-page/upload_album_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class UploadAlbumPageView extends GetView<UploadAlbumPageController> {
  const UploadAlbumPageView({super.key});

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
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Buat Album',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.015,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UploadAlbumPageComponentOne(),
                SizedBox(height: height * 0.03),
                UploadAlbumPageComponentTwo(),
                SizedBox(height: height * 0.03),
                UploadAlbumPageComponentThree(),
                SizedBox(height: height * 0.05),
                Obx(() => CommonButton(
                      isLoading: controller.isLoadingUploadAlbum.value,
                      text: 'Buat Album',
                      backgroundColor: blackColor,
                      textColor: whiteColor,
                      onPressed: () {
                        controller.storeAlbumByAdmin();
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
