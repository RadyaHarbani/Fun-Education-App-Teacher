import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/report-widget/report_item.dart';
import 'package:fun_education_app_teacher/app/pages/list-detail-saving-page/list_detail_saving_page_controller.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';

class ListDetailSavingPageComponentTwo
    extends GetView<ListDetailSavingPageController> {
  const ListDetailSavingPageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: controller.showCurrentUserModel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(
                Routes.DETAIL_SAVING_PAGE,
              );
            },
            child: ReportItem(
              name: '${controller.showCurrentUserModel[index].fullName}',
              image: '${controller.showCurrentUserModel[index].profilePicture}',
            ),
          );
        }));
  }
}
