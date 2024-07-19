import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/detail_task_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/widgets/task_widget/detail_task_item.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailTaskPageComponentOne extends GetView<DetailTaskPageController> {
  const DetailTaskPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => DetailTaskItem(
              type: '${controller.showByTaskIdDetail.value.category}',
              title: '${controller.showByTaskIdDetail.value.title}',
              description: '${controller.showByTaskIdDetail.value.description}',
              madeIn:
                  '${controller.showByTaskIdDetail.value.createdAt != null ? DateFormat('EEEE,\ndd MMMM').format(controller.showByTaskIdDetail.value.createdAt!) : 'N/A'}',
              deadline:
                  '${controller.showByTaskIdDetail.value.deadline != null ? DateFormat('EEEE,\ndd MMMM').format(controller.showByTaskIdDetail.value.deadline!) : 'N/A'}',
              status: '${controller.showByTaskIdDetail.value.status}',
              function1: () {},
              function2: () {},
            ))
      ],
    );
  }
}
