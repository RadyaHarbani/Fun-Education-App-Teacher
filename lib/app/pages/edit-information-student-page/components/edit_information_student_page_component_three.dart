import 'package:flutter/cupertino.dart';
import 'package:fun_education_app_teacher/app/global-component/custom_radio_button.dart';
import 'package:fun_education_app_teacher/app/pages/edit-information-student-page/edit_information_student_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class EditInformationStudentPageComponentThree
    extends GetView<EditInformationStudentPageController> {
  const EditInformationStudentPageComponentThree({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shift Belajar',
          style: tsBodyLargeRegular(blackColor),
        ),
        SizedBox(height: height * 0.02),
        Obx(() => Column(
              children: [
                CustomRadioButton(
                  title: 'Jam 08.00 - 10.00',
                  value: '08.00 - 10.00',
                  groupValue: controller.selectedShift.value,
                  onChanged: (value) => controller.selectedShift(value),
                ),
                CustomRadioButton(
                  title: 'Jam 10.00 - 11.30',
                  value: '10.00 - 11.30',
                  groupValue: controller.selectedShift.value,
                  onChanged: (value) => controller.selectedShift(value),
                ),
                CustomRadioButton(
                  title: 'Jam 11.30 - 13.00',
                  value: '11.30 - 13.00',
                  groupValue: controller.selectedShift.value,
                  onChanged: (value) => controller.selectedShift(value),
                ),
                CustomRadioButton(
                  title: 'Jam 13.00 - 14.00',
                  value: '13.00 - 14.00',
                  groupValue: controller.selectedShift.value,
                  onChanged: (value) => controller.selectedShift(value),
                ),
                CustomRadioButton(
                  title: 'Jam 14.00 - 15.00',
                  value: '14.00 - 15.00',
                  groupValue: controller.selectedShift.value,
                  onChanged: (value) => controller.selectedShift(value),
                ),
              ],
            )),
      ],
    );
  }
}
