import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/report-history-page/report_history_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class ReportHistoryPageComponentFour
    extends GetView<ReportHistoryPageController> {
  const ReportHistoryPageComponentFour({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    final double width = mediaQuery.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          group: AutoSizeGroup(),
          maxLines: 1,
          'Catatan Guru :',
          style: tsBodyMediumSemibold(blackColor),
        ),
        SizedBox(height: height * 0.02),
        Container(
          width: width,
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.06,
            vertical: height * 0.025,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: greyColor.withOpacity(0.05),
          ),
          child: AutoSizeText(
                group: AutoSizeGroup(),
                'Test',
                style: tsBodySmallRegular(blackColor),
              ),
        ),
      ],
    );
  }
}
