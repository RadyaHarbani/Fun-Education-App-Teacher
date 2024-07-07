import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/add-task-page/add_task_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTaskPageComponentFour extends GetView<AddTaskPageController> {
  const AddTaskPageComponentFour({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Waktu Tenggat',
          style: tsBodyLargeRegular(blackColor),
        ),
        SizedBox(height: height * 0.02),
        Container(
          width: width,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.05,
              vertical: height * 0.02,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => AutoSizeText(
                      '${DateFormat('EEEE, dd MMMM yyyy').format(controller.selectedDateTime.value)}',
                      style: tsBodySmallRegular(blackColor),
                    )),
                InkWell(
                  onTap: () {
                    controller.selectDateTime(context);
                  },
                  child: Icon(
                    Icons.calendar_today_rounded,
                    color: blackColor,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
