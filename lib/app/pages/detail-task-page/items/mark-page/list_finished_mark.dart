import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/detail_task_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-task-page/widgets/mark_widget/mark_student_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListFinishedMark extends GetView<DetailTaskPageController> {
  const ListFinishedMark({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/icons/icDocument.svg',
            ),
            SizedBox(width: width * 0.02),
            AutoSizeText(
              'Selesai',
              group: AutoSizeGroup(),
              maxLines: 1,
              style: tsBodyMediumSemibold(blackColor),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        Obx(() => ListView.builder(
            itemCount: controller.finishedList.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return MarkStudentItem(
                studentName: '${controller.finishedList[index].fullName}',
                date:
                    '${DateFormat('EEEE, dd MMMM').format(controller.finishedList[index].createdAt!)}',
                profiePicture: controller.finishedList[index].profilePicture!,
                mark: '${controller.finishedList[index].grade}',
              );
            })),
      ],
    );
  }
}
