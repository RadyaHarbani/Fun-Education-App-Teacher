import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_button.dart';
import 'package:fun_education_app_teacher/app/pages/gallery-page/gallery_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BottomsheetDetailPhotoGallery extends GetView<GalleryPageController> {
  const BottomsheetDetailPhotoGallery({super.key, this.arguments});

  final arguments;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return SizedBox(
      height: height * 0.8,
      child: Padding(
        padding: EdgeInsets.only(
          top: height * 0.02,
          bottom: height * 0.03,
          left: width * 0.05,
          right: width * 0.05,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width * 0.15,
              height: height * 0.008,
              decoration: BoxDecoration(
                color: greyColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            SizedBox(height: height * 0.03),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width,
                    height: height * 0.27,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                          '${arguments.image}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        color: blackColor,
                        size: 20,
                      ),
                      SizedBox(width: width * 0.02),
                      AutoSizeText(
                        '${DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(arguments.createdAt)}',
                        group: AutoSizeGroup(),
                        maxLines: 1,
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        '${arguments.title}',
                        group: AutoSizeGroup(),
                        maxLines: 1,
                        style: tsBodyMediumSemibold(blackColor),
                      ),
                      SizedBox(height: height * 0.01),
                      AutoSizeText(
                        '${arguments.description}',
                        group: AutoSizeGroup(),
                        maxLines: 3,
                        style: tsBodySmallRegular(blackColor),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            CommonButton(
              text: 'Download Gambar',
              backgroundColor: blackColor,
              textColor: whiteColor,
              icon: Icons.file_download_rounded,
              onPressed: () {
                controller.savePhotoToGallery(arguments.image);
                Navigator.pop(context);
              },
            ),
            SizedBox(height: height * 0.005),
            CommonButton(
              text: 'Hapus Foto',
              backgroundColor: dangerColor,
              textColor: whiteColor,
              onPressed: () {
                controller.deletePhotoByAdmin(
                  arguments.id.toString(),
                  arguments.albumId.toString(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
