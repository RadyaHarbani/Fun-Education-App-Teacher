import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/detail_class_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-class-page/widget/task-widget/task_item.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListCloseTask extends GetView<DetailClassPageController> {
  const ListCloseTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.showByCloseStatusList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(
                Routes.DETAIL_TASK_PAGE,
                arguments:
                    controller.showByCloseStatusList[index].id.toString(),
              );
            },
            child: TaskItem(
              type: '${controller.showByCloseStatusList[index].category}',
              title: '${controller.showByCloseStatusList[index].title}',
              madeIn:
                  '${DateFormat('EEEE,\ndd MMMM').format(controller.showByCloseStatusList[index].createdAt!)}',
              deadline:
                  '${DateFormat('EEEE,\ndd MMMM').format(controller.showByCloseStatusList[index].deadline!)}',
              status: 'Ditutup',
            ),
          );
        },
      ),
    );
  }
}
