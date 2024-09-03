import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/task-widget/task_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ListArchiveTask extends GetView<DetailClassPageController> {
  const ListArchiveTask({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Obx(
      () => controller.isLoadingDetailClass.value
          ? ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: width * 0.4,
                      height: height * 0.25,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                );
              },
            )
          : ListView.builder(
              itemCount: controller.showByArchiveStatusList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(
                      Routes.DETAIL_TASK_PAGE,
                      arguments: controller.showByArchiveStatusList[index].id
                          .toString(),
                    );
                  },
                  child: TaskItem(
                    type:
                        '${controller.showByArchiveStatusList[index].category}',
                    title: '${controller.showByArchiveStatusList[index].title}',
                    madeIn:
                        '${DateFormat('EEEE,\ndd MMMM', 'id_ID').format(controller.showByArchiveStatusList[index].createdAt!)}',
                    deadline:
                        '${DateFormat('EEEE,\ndd MMMM', 'id_ID').format(controller.showByArchiveStatusList[index].deadline!)}',
                    widget: PopupMenuButton(
                      color: whiteColor,
                      onSelected: (value) {
                        controller.updateStatusTaskByAdmin(
                          controller.showByArchiveStatusList[index].id!,
                          value,
                        );
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text(
                            'Pulihkan',
                            style: tsBodySmallSemibold(blackColor),
                          ),
                          value: 'Tersedia',
                        ),
                      ],
                    ),
                    status: 'Diarsipkan',
                  ),
                );
              },
            ),
    );
  }
}
