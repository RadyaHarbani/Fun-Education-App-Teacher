import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/detail_report_page_controller.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';

class DetailReportPageComponentTwo extends GetView<DetailReportPageController> {
  const DetailReportPageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    final double width = mediaQuery.width;
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        vertical: height * 0.025,
        horizontal: width * 0.05,
      ),
      decoration: BoxDecoration(
        color: blackColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: AutoSizeText.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Ananda,\n',
              style: tsBodySmallRegular(primaryColor),
            ),
            TextSpan(
              text: '${controller.userFullName}',
              style: tsBodySmallSemibold(whiteColor),
            ),
          ],
        ),
        group: AutoSizeGroup(),
        maxLines: 2,
      ),
    );
  }
}
