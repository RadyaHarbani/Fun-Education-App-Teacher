import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/report-widget/report_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class ListHadirPermission extends GetView<DetailClassPageController> {
  const ListHadirPermission({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Laporan Hadir',
          group: AutoSizeGroup(),
          maxLines: 1,
          style: tsBodyMediumRegular(blackColor),
        ),
        SizedBox(height: height * 0.01),
        Obx(
          () => ListView.builder(
              itemCount: controller.showUserPermissionHadir.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.DETAIL_REPORT_PAGE,
                      arguments: {
                        'userId': controller.showUserPermissionHadir[index].id,
                        'userFullName':
                            controller.showUserPermissionHadir[index].fullName,
                        'incomingShift': controller
                            .showAllIncomingShiftModel.value.shiftMasuk,
                        'date': controller.selectedDateTime.value,
                      },
                    );
                  },
                  child: ReportItem(
                    name:
                        '${controller.showUserPermissionHadir[index].fullName}',
                    image:
                        '${controller.showUserPermissionHadir[index].profilePicture}',
                    permission:
                        '${controller.showUserPermissionHadir[index].permission}',
                  ),
                );
              }),
        ),
        SizedBox(height: height * 0.02),
      ],
    );
  }
}
