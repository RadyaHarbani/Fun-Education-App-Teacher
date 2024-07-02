import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/archive/detail-kelas-page/detail_kelas_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class AlurBelajarOption extends GetView<DetailKelasPageController> {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final String value;

  const AlurBelajarOption({
    required this.title,
    required this.subtitle1,
    required this.subtitle2,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;

    return GestureDetector(
      onTap: () {
        final bool isChecked = controller.selectedOptions.contains(value);
        controller.selectOption(value, !isChecked);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: height * 0.017, horizontal: width * 0.05),
        decoration: BoxDecoration(
            color: greyColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    title,
                    style: tsBodyMediumSemibold(blackColor),
                  ),
                  SizedBox(height: 5),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "•",
                        style: tsBodySmallRegular(blackColor),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: AutoSizeText(
                          subtitle1,
                          style: tsBodyMediumRegular(blackColor),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        "•",
                        style: tsBodySmallRegular(blackColor),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: AutoSizeText(
                          subtitle2,
                          style: tsBodyMediumRegular(blackColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Obx(
              () {
                final bool isChecked =
                    controller.selectedOptions.contains(value);
                return Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: greyColor.withOpacity(0.1),
                  ),
                  child: isChecked
                      ? Center(
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  isChecked ? primaryColor : transparentColor,
                            ),
                          ),
                        )
                      : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
