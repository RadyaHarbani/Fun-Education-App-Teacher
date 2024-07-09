import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/gallery-page/gallery_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class GalleryPageComponentOne extends GetView<GalleryPageController> {
  const GalleryPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          group: AutoSizeGroup(),
          maxLines: 1,
          'Album Foto',
          style: tsBodyMediumSemibold(blackColor),
        ),
        SizedBox(height: height * 0.02),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: width * 0.02,
            mainAxisSpacing: height * 0.01,
            childAspectRatio: 1.25,
          ),
          itemCount: 5,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Get.toNamed(
                //   // Routes.DETAIL_ALBUM_PHOTO,
                //   // arguments:
                //   //   controller.showAllAlbumPhotoModel[index],

                // );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://i.pravatar.cc/50?u=$index',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.035,
                    vertical: height * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AutoSizeText(
                        group: AutoSizeGroup(),
                        maxLines: 2,
                        'Outbound - Salatiga',
                        style: tsBodyMediumSemibold(whiteColor).copyWith(
                          height: 1.2,
                        ),
                      ),
                      SizedBox(height: height * 0.005),
                      AutoSizeText(
                        group: AutoSizeGroup(),
                        maxLines: 1,
                        '5 Foto',
                        style: tsBodySmallRegular(whiteColor),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
