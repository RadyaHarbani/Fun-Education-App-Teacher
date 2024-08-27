import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/upload-photo-page/components/upload_photo_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/upload-photo-page/components/upload_photo_page_component_three.dart';
import 'package:fun_education_app_teacher/app/pages/upload-photo-page/components/upload_photo_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/upload-photo-page/upload_photo_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UploadPhotoPageView extends GetView<UploadPhotoPageController> {
  const UploadPhotoPageView({super.key});

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
          'Unggah Foto',
          style: tsBodyMediumSemibold(blackColor),
        ),
      ),
      body: SmartRefresher(
        controller: controller.refreshController,
        onRefresh: () async {
          await controller.showAllAlbums();
          controller.refreshController.refreshCompleted();
        },
        header: WaterDropHeader(
          complete: Text(
            'Refresh Completed',
            style: tsBodySmallRegular(blackColor),
          ),
          waterDropColor: primaryColor,
        ),
        child: SingleChildScrollView(
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
                  UploadPhotoPageComponentOne(),
                  SizedBox(height: height * 0.03),
                  UploadPhotoPageComponentTwo(),
                  SizedBox(height: height * 0.03),
                  UploadPhotoPageComponentThree(),
                  SizedBox(height: height * 0.05),
                  Obx(() => CommonButton(
                        isLoading: controller.isLoadingUploadPhoto.value,
                        text: 'Unggah Foto',
                        backgroundColor: blackColor,
                        textColor: whiteColor,
                        onPressed: () {
                          print('album id : ${controller.albumId.value}');
                          controller.storePhotoByAdmin();
                        },
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
