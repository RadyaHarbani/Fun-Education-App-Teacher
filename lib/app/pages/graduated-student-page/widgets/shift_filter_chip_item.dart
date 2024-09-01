import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/graduated-student-page/graduated_student_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class ShiftFilterChipItem extends GetView<GraduatedStudentPageController> {
  const ShiftFilterChipItem({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    final double width = mediaQuery.width;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: controller.shifts.map((shift) {
          return Obx(() {
            final isSelected = controller.selectedShift.value == shift;
            return Padding(
              padding: EdgeInsets.only(
                right: width * 0.02,
              ),
              child: ChoiceChip(
                backgroundColor: whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                label: Text(
                  shift,
                  style: tsBodySmallSemibold(
                    isSelected ? whiteColor : blackColor,
                  ),
                ),
                side: BorderSide.none,
                labelPadding: EdgeInsets.symmetric(
                  horizontal: width * 0.02,
                  vertical: height * 0.005,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                  vertical: height * 0.008,
                ),
                selectedColor: greenColor,
                showCheckmark: false,
                selected: isSelected,
                onSelected: (bool selected) {
                  controller.selectedShift.value = selected ? shift : '';
                  controller.filterGraduatedStudentsByShift();
                },
              ),
            );
          });
        }).toList(),
      ),
    );
  }
}
