import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/report-widget/report_item.dart';
import 'package:fun_education_app_teacher/app/pages/list-detail-saving-page/list_detail_saving_page_controller.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class ListDetailSavingPageComponentTwo
    extends GetView<ListDetailSavingPageController> {
  const ListDetailSavingPageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Obx(() {
      if (controller.isLoadingListDetailSaving.value) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 7,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: height * 0.01),
                width: width,
                height: height * 0.09,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
        );
      } else {
        return ListView.builder(
            itemCount: controller.showCurrentUserModel.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.toNamed(
                    Routes.DETAIL_SAVING_PAGE,
                    arguments: controller.showCurrentUserModel[index].id,
                  );
                },
                child: ReportItem(
                  name: '${controller.showCurrentUserModel[index].fullName}',
                  image:
                      '${controller.showCurrentUserModel[index].profilePicture}',
                  permission: 'Hadir',
                ),
              );
            });
      }
    });
  }
}
