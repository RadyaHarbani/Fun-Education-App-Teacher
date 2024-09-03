import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_alert_dialog.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/detail_task_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/widgets/task_widget/detail_task_item.dart';
import 'package:fun_education_app_teacher/common/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class DetailTaskPageComponentOne extends GetView<DetailTaskPageController> {
  const DetailTaskPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          Obx(() {
            if (controller.isLoadingDetailTask.value) {
              return Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: height * 0.6,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            } else {
              return DetailTaskItem(
                type: '${controller.showByTaskIdDetail.value.category}',
                title: '${controller.showByTaskIdDetail.value.title}',
                description:
                    '${controller.showByTaskIdDetail.value.description}',
                madeIn:
                    '${controller.showByTaskIdDetail.value.createdAt != null ? DateFormat('EEEE,\ndd MMMM', 'id_ID').format(controller.showByTaskIdDetail.value.createdAt!) : 'N/A'}',
                deadline:
                    '${controller.showByTaskIdDetail.value.deadline != null ? DateFormat('EEEE,\ndd MMMM', 'id_ID').format(controller.showByTaskIdDetail.value.deadline!) : 'N/A'}',
                status: '${controller.showByTaskIdDetail.value.status}',
                function1: () {
                  if (controller.showByTaskIdDetail.value.status ==
                      'Diarsipkan') {
                    controller.updateStatusTaskByAdmin(
                        controller.showByTaskIdDetail.value.id!, 'Tersedia');
                  } else {
                    Get.toNamed(
                      Routes.EDIT_TASK_PAGE,
                      arguments: controller.showByTaskIdDetail.value,
                    );
                  }
                },
                function2: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CommonAlertDialog(
                        title: 'Konfirmasi',
                        content: 'Apakah anda yakin ingin menghapus tugas?',
                        cancelButtonText: 'Tidak',
                        confirmButtonText: 'Iya',
                        onConfirm: () {
                          Get.back();
                          controller.deleteTaskByAdmin(
                              controller.showByTaskIdDetail.value.id!);
                        },
                      );
                    },
                  );
                },
              );
            }
          }),
          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }
}
