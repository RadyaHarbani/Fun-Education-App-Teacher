import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/add-siswa-page/add_siswa_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/add-siswa-page/widgets/custom_radio_button.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class AddSiswaComponentThree extends GetView<AddSiswaPageController> {
  const AddSiswaComponentThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Shift Belajar', style: tsBodyLargeRegular(blackColor)),
        Obx(() => Column(
              children: [
                CustomRadioButton(
                  title: 'Jam 08.00 - 10.00',
                  value: '08.00 - 10.00',
                  groupValue: controller.selectedOption.value,
                  onChanged: (value) => controller.selectTime(value),
                ),
                CustomRadioButton(
                  title: 'Jam 10.00 - 11.30',
                  value: '10.00 - 11.30',
                  groupValue: controller.selectedOption.value,
                  onChanged: (value) => controller.selectTime(value),
                ),
                CustomRadioButton(
                  title: 'Jam 11.30 – 13.00',
                  value: '11.30 – 13.00',
                  groupValue: controller.selectedOption.value,
                  onChanged: (value) => controller.selectTime(value),
                ),
                CustomRadioButton(
                  title: 'Jam 13.00 – 14.00',
                  value: '13.00 – 14.00',
                  groupValue: controller.selectedOption.value,
                  onChanged: (value) => controller.selectTime(value),
                ),
                CustomRadioButton(
                  title: 'Jam 14.00 – 15.00',
                  value: '14.00 – 15.00',
                  groupValue: controller.selectedOption.value,
                  onChanged: (value) => controller.selectTime(value),
                ),
              ],
            )),
      ],
    );
  }
}
