// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/pages/detail-album-photo-page/components/detail_album_photo_page_component_one.dart';
import 'package:fun_education_app_teacher/app/pages/detail-album-photo-page/components/detail_album_photo_page_component_two.dart';
import 'package:fun_education_app_teacher/app/pages/detail-album-photo-page/detail_album_photo_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailAlbumPhotoPageView extends GetView<DetailAlbumPhotoPageController> {
  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 20,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: AutoSizeText(
            group: AutoSizeGroup(),
            maxLines: 1,
            'Detail Album',
            style: tsBodyLargeSemibold(blackColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            top: height * 0.01,
            left: width * 0.05,
            right: width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailAlbumPhotoPageComponentOne(),
              SizedBox(height: height * 0.03),
              DetailAlbumPhotoPageComponentTwo(),
            ],
          ),
        ),
      ),
    );
  }
}
