import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/add_report_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/widgets/select_point_item.dart';
import 'package:get/get.dart';

class AddReportPageComponentTwo extends GetView<AddReportPageController> {
  const AddReportPageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return Column(
      children: List.generate(
        controller.pointNames.length,
        (index) => Padding(
          padding: EdgeInsets.only(bottom: height * 0.02),
          child: Obx(
            () => SelectPointItem(
              pointName: controller.pointNames[index],
              selectedPointType: controller.points[index].value,
              onChanged: (value) {
                controller.points[index].value = value;
              },
            ),
          ),
        ),
      ),
    );
  }
}
