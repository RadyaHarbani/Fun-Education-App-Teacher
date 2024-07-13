import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:overlap_stack/overlap_stack.dart';

class DetailClassComponentOne extends GetView<DetailClassPageController> {
  const DetailClassComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() => AutoSizeText.rich(
              group: AutoSizeGroup(),
              maxLines: 2,
              TextSpan(
                text: 'Shift Masuk\n',
                style: tsBodySmallRegular(blackColor),
                children: [
                  TextSpan(
                    text:
                        '${controller.showAllIncomingShiftModel.value.shiftMasuk}',
                    style: tsTitleSmallSemibold(blackColor),
                  ),
                ],
              ),
            )),
        InkWell(
          onTap: () {
            Get.toNamed(
              Routes.LIST_STUDENT_PAGE,
              arguments: controller.showAllIncomingShiftModel.value.shiftMasuk
                  .toString(),
            );
          },
          child: Row(
            children: [
              Container(
                height: height * 0.0435,
                width: width * 0.4,
                child: Obx(() => OverlapStack.builder(
                      leadIndex: 4,
                      itemLimit: 5,
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
              SizedBox(width: width * 0.015),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: blackColor,
                size: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
