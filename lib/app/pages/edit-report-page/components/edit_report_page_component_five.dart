import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/global-component/common_multiline_text_field.dart';
import 'package:fun_education_app_teacher/app/pages/edit-report-page/edit_report_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class EditReportPageComponentFive extends GetView<EditReportPageController> {
  const EditReportPageComponentFive({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText.rich(
          group: AutoSizeGroup(),
          maxLines: 2,
          TextSpan(
            text: 'Catatan Dari Guru\n',
            style: tsBodyLargeRegular(blackColor),
            children: [
              TextSpan(
                text: '*opsional',
                style: tsBodySmallRegular(dangerColor),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
        CommonMultilineTextfield(
          maxlines: 5,
          hintText: 'Masukkan Catatan',
          onChanged: (value) {},
          controller: controller.teachersNote,
        ),
      ],
    );
  }
}
