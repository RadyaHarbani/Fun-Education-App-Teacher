import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/list-detail-saving-page/list_detail_saving_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:overlap_stack/overlap_stack.dart';

class ListDetailSavingPageComponentOne
    extends GetView<ListDetailSavingPageController> {
  const ListDetailSavingPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AutoSizeText.rich(
          group: AutoSizeGroup(),
          maxLines: 2,
          TextSpan(
            text: 'Shift Masuk\n',
            style: tsBodySmallRegular(blackColor),
            children: [
              TextSpan(
                text: '${Get.arguments}',
                style: tsTitleSmallSemibold(blackColor),
              ),
            ],
          ),
        ),
        Container(
          height: height * 0.0435,
          width: width * 0.35,
          child: Obx(() => OverlapStack.builder(
                leadIndex: 7,
                itemLimit: min(controller.showCurrentUserModel.length, 5),
                itemCount: controller.showCurrentUserModel.length,
                align: OverlapStackAlign.start,
                itemBuilder: (context, i) {
                  return CircleAvatar(
                    foregroundImage: NetworkImage(
                      '${controller.showCurrentUserModel[i].profilePicture}',
                    ),
                  );
                },
                infoBuilder: (context, remaining) {
                  return CircleAvatar(
                    backgroundColor: whiteColor,
                    foregroundColor: blackColor,
                    child: AutoSizeText(
                      '+$remaining',
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      style: tsBodySmallRegular(blackColor),
                    ),
                  );
                },
              )),
        ),
      ],
    );
  }
}
