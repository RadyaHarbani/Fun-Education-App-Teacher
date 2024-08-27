import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/detail_report_page_controller.dart';
import 'package:fun_education_app_teacher/app/pages/detail-report-page/widgets/total_point_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailReportPageComponentOne extends GetView<DetailReportPageController> {
  const DetailReportPageComponentOne({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double height = mediaQuery.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText.rich(
          group: AutoSizeGroup(),
          maxLines: 1,
          TextSpan(
            text:
                '${DateFormat('EEEE,', 'id_ID').format(controller.userDate)} ',
            style: tsBodyLargeSemibold(blackColor),
            children: [
              TextSpan(
                text:
                    '${DateFormat('dd MMMM yyyy', 'id_ID').format(controller.userDate)}',
                style: tsBodyLargeRegular(blackColor),
              ),
            ],
          ),
        ),
        SizedBox(height: height * 0.02),
        Obx(() => TotalPointItem(totalPoint: controller.userGrade.value)),
      ],
    );
  }
}
