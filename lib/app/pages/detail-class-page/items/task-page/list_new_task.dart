import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/task-widget/task_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListNewTask extends GetView<DetailClassPageController> {
  const ListNewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.showByNewStatusList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(
                Routes.DETAIL_TASK_PAGE,
                arguments: controller.showByNewStatusList[index].id.toString(),
              );
            },
            child: TaskItem(
              type: '${controller.showByNewStatusList[index].category}',
              title: '${controller.showByNewStatusList[index].title}',
              madeIn:
                  '${DateFormat('EEEE,\ndd MMMM').format(controller.showByNewStatusList[index].createdAt!)}',
              deadline:
                  '${DateFormat('EEEE,\ndd MMMM').format(controller.showByNewStatusList[index].deadline!)}',
              widget: PopupMenuButton(
                color: whiteColor,
                onSelected: (value) {
                  if (value == 'Ditutup') {
                    controller.updateStatusTaskByAdmin(
                      controller.showByNewStatusList[index].id!,
                      value,
                    );
                  } else {
                    controller.updateStatusTaskByAdmin(
                      controller.showByNewStatusList[index].id!,
                      value,
                    );
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text(
                      'Tutup',
                      style: tsBodySmallSemibold(blackColor),
                    ),
                    value: 'Ditutup',
                  ),
                  PopupMenuItem(
                    child: Text(
                      'Arsipkan',
                      style: tsBodySmallSemibold(blackColor),
                    ),
                    value: 'Diarsipkan',
                  ),
                ],
              ),
              status: 'Terbaru',
            ),
          );
        },
      ),
    );
  }
}
