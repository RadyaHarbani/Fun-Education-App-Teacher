import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/add_report_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/widgets/permission_report_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class AddReportPageComponentTwo extends GetView<AddReportPageController> {
  const AddReportPageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          'Perizinan :',
          group: AutoSizeGroup(),
          maxLines: 1,
          style: tsBodyLargeRegular(blackColor),
        ),
        SizedBox(height: height * 0.015),
        Obx(() => Row(
              children: [
                PermissionReportItem(
                  title: 'Hadir',
                  value: 'Hadir',
                  groupValue: controller.selectedPermission.value,
                  onChanged: (value) => controller.selectedPermission(value),
                ),
                SizedBox(width: width * 0.02),
                PermissionReportItem(
                  title: 'Izin',
                  value: 'Izin',
                  groupValue: controller.selectedPermission.value,
                  onChanged: (value) => controller.selectedPermission(value),
                ),
                SizedBox(width: width * 0.02),
                PermissionReportItem(
                  title: 'Sakit',
                  value: 'Sakit',
                  groupValue: controller.selectedPermission.value,
                  onChanged: (value) => controller.selectedPermission(value),
                ),
              ],
            )),
      ],
    );
  }
}
