import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/upload-photo-page/upload_photo_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class UploadPhotoPageComponentThree extends GetView<UploadPhotoPageController> {
  const UploadPhotoPageComponentThree({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText.rich(
          group: AutoSizeGroup(),
          maxLines: 2,
          TextSpan(
            text: 'Tambahkan ke Album\n',
            style: tsBodyLargeRegular(blackColor),
            children: [
              TextSpan(
                text: '*opsional',
                style: tsBodySmallRegular(dangerColor),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
        Obx(
          () => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: width * 0.02,
              mainAxisSpacing: height * 0.01,
              childAspectRatio: 1.6,
            ),
            itemCount: controller.showAllAlbumsModel.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final album = controller.showAllAlbumsModel[index];
              return Obx(
                () {
                  final isSelected = controller.albumId.value == album.id!;
                  return InkWell(
                    onTap: () {
                      if (controller.albumId.value == album.id!) {
                        controller.albumId.value = '';
                      } else {
                        controller.albumId.value = album.id!;
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(album.cover!),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.6),
                            BlendMode.darken,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.035,
                          vertical: height * 0.02,
                        ),
                        child: isSelected
                            ? Icon(
                                Icons.check_circle_outline_rounded,
                                color: successColor,
                                size: 35,
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AutoSizeText(
                                    group: AutoSizeGroup(),
                                    maxLines: 2,
                                    album.name!,
                                    style: tsBodySmallSemibold(whiteColor)
                                        .copyWith(
                                      height: 1.25,
                                    ),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  AutoSizeText(
                                    group: AutoSizeGroup(),
                                    maxLines: 1,
                                    '${album.galleryCount} Foto',
                                    style: tsBodySmallRegular(whiteColor),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
