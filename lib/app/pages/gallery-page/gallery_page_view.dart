import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/gallery-page/components/bottomsheet_select_upload_method.dart';
import 'package:fun_education_app_teacher/app/pages/gallery-page/components/gallery_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/gallery-page/components/gallery_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/gallery-page/gallery_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class GalleryPageView extends GetView<GalleryPageController> {
  const GalleryPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SmartRefresher(
          controller: controller.refreshController,
          onRefresh: () async {
            await controller.showAllPhotos();
            
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
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.03,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText.rich(
                    group: AutoSizeGroup(),
                    maxLines: 1,
                    TextSpan(
                      text: 'Galeri ',
                      style: tsTitleSmallRegular(blackColor),
                      children: [
                        TextSpan(
                          text: 'Ananda',
                          style: tsTitleSmallSemibold(blackColor),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  GalleryPageComponentOne(),
                  SizedBox(height: height * 0.04),
                  GalleryPageComponentTwo(),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: whiteColor,
            builder: (context) => BottomSheetSelectUploadMethod(),
          );
        },
        child: Icon(
          Icons.add_rounded,
          color: whiteColor,
        ),
        backgroundColor: primaryColor,
      ),
    );
  }
}
