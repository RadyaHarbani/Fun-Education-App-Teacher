import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/report-widget/report_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class ListUndoneReport extends GetView<DetailClassPageController> {
  const ListUndoneReport({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText.rich(
          TextSpan(
            text: 'Belum Ada Laporan\n',
            style: tsBodyMediumRegular(blackColor).copyWith(height: 1.3),
            children: [
              TextSpan(
                text: '*Silahkan isi laporan ananda',
                style: tsBodySmallRegular(dangerColor),
              ),
            ],
          ),
          group: AutoSizeGroup(),
          maxLines: 2,
        ),
        SizedBox(height: height * 0.015),
        Obx(
          () => ListView.builder(
              itemCount: controller.showUserUndoneModel.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.ADD_REPORT_PAGE,
                      arguments: {
                        'incomingShift': controller
                            .showAllIncomingShiftModel.value.shiftMasuk,
                        'selectedDate': controller.selectedDateTime.value,
                      },
                    );
                  },
                  child: ReportItem(
                    name: '${controller.showUserUndoneModel[index].fullName}',
                    image:
                        '${controller.showUserUndoneModel[index].profilePicture}',
                    permission:
                        '${controller.showUserUndoneModel[index].permission}',
                  ),
                );
              }),
        ),
        SizedBox(height: height * 0.02),
      ],
    );
  }
}
