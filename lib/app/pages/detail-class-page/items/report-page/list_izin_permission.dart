import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/report-widget/report_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class ListIzinPermission extends GetView<DetailClassPageController> {
  const ListIzinPermission({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Laporan Izin',
          group: AutoSizeGroup(),
          maxLines: 1,
          style: tsBodyMediumRegular(blackColor),
        ),
        SizedBox(height: height * 0.01),
        Obx(
          () => ListView.builder(
              itemCount: controller.showUserPermissionIzin.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.DETAIL_REPORT_PAGE,
                      arguments: {
                        'userId': controller.showUserPermissionIzin[index].id,
                        'userFullName':
                            controller.showUserPermissionIzin[index].fullName,
                        'incomingShift': controller
                            .showAllIncomingShiftModel.value.shiftMasuk,
                        'date': controller.selectedDateTime.value,
                      },
                    );
                  },
                  child: ReportItem(
                    name:
                        '${controller.showUserPermissionIzin[index].fullName}',
                    image:
                        '${controller.showUserPermissionIzin[index].profilePicture}',
                    permission:
                        '${controller.showUserPermissionIzin[index].permission}',
                  ),
                );
              }),
        ),
        SizedBox(height: height * 0.02),
      ],
    );
  }
}
