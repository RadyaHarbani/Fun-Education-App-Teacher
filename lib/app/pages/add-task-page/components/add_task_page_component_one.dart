import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/custom_radio_button.dart';
import 'package:fun_education_app_teacher/app/pages/add-task-page/add_task_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class AddTaskPageComponentOne extends GetView<AddTaskPageController> {
  const AddTaskPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tipe Tugas',
          style: tsBodyLargeRegular(blackColor),
        ),
        SizedBox(height: height * 0.02),
        Obx(
          () => Column(
            children: [
              CustomRadioButton(
                title: 'Dikte & Menulis',
                value: 'Dikte & Menulis',
                color: blueColor.withOpacity(0.05),
                groupValue: controller.selectedType.value,
                onChanged: (value) => controller.selectedType(value),
              ),
              CustomRadioButton(
                title: 'Kreasi',
                value: 'Kreasi',
                color: primaryColor.withOpacity(0.05),
                groupValue: controller.selectedType.value,
                onChanged: (value) => controller.selectedType(value),
              ),
              CustomRadioButton(
                title: 'Membaca',
                value: 'Membaca',
                color: greenColor.withOpacity(0.05),
                groupValue: controller.selectedType.value,
                onChanged: (value) => controller.selectedType(value),
              ),
              CustomRadioButton(
                title: 'Berhitung',
                value: 'Berhitung',
                color: warningColor.withOpacity(0.05),
                groupValue: controller.selectedType.value,
                onChanged: (value) => controller.selectedType(value),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
