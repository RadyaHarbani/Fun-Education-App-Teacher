import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/report-widget/report_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailClassComponentThree extends GetView<DetailClassPageController> {
  const DetailClassComponentThree({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText.rich(
              group: AutoSizeGroup(),
              maxLines: 2,
              TextSpan(
                text: 'Laporan Hari Ini\n',
                style: tsBodyLargeSemibold(blackColor),
                children: [
                  TextSpan(
                    text:
                        '${DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now())}',
                    style: tsBodySmallRegular(blackColor),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(
                  Routes.ADD_REPORT_PAGE,
                  arguments:
                      controller.showAllIncomingShiftModel.value.shiftMasuk!,
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.012,
                  horizontal: width * 0.055,
                ),
                decoration: BoxDecoration(
                  color: blackColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    AutoSizeText(
                      'Buat Laporan',
                      group: AutoSizeGroup(),
                      maxLines: 1,
                      style: tsBodySmallMedium(whiteColor),
                    ),
                    SizedBox(width: width * 0.02),
                    Icon(
                      Icons.add_rounded,
                      color: whiteColor,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.025),
        Expanded(
          child: Obx(() => ListView.builder(
              itemCount: controller.showUserDoneModel.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.DETAIL_REPORT_PAGE,
                      arguments: {
                        'userId': controller.showUserDoneModel[index].id,
                        'userFullName':
                            controller.showUserDoneModel[index].fullName,
                        'incomingShift': controller
                            .showAllIncomingShiftModel.value.shiftMasuk,
                        'date': DateTime.now(),
                      },
                    );
                  },
                  child: ReportItem(
                    name: '${controller.showUserDoneModel[index].fullName}',
                    image:
                        '${controller.showUserDoneModel[index].profilePicture}',
                    permission:
                        '${controller.showUserDoneModel[index].permission}',
                  ),
                );
              })),
        ),
      ],
    );
  }
}
