import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-mark-page/detail_mark_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailMarkPageComponentTwo extends GetView<DetailMarkPageController> {
  const DetailMarkPageComponentTwo({super.key});

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
            children: [
              TextSpan(
                text: 'Catatan Orang Tua\n',
                style: tsBodyMediumSemibold(blackColor),
              ),
              TextSpan(
                text: '*opsional',
                style: tsBodySmallRegular(dangerColor),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
        Obx(() => Container(
              width: width,
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.02,
              ),
              decoration: BoxDecoration(
                color: greyColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: AutoSizeText(
                '${controller.showByUserIdDetail.value.note ?? 'Tidak Ada Catatan'}',
                group: AutoSizeGroup(),
                style: tsBodySmallSemibold(blackColor),
              ),
            )),
      ],
    );
  }
}
