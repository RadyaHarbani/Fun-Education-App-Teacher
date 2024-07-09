import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/app/pages/add-report-page/widgets/point_description_item.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class EditReportPageComponentTwo extends StatelessWidget {
  const EditReportPageComponentTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
        horizontal: width * 0.05,
      ),
      decoration: BoxDecoration(
        color: greyColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            'Keterangan :',
            group: AutoSizeGroup(),
            maxLines: 1,
            style: tsBodyMediumSemibold(blackColor),
          ),
          SizedBox(height: height * 0.02),
          PointDescriptionItem(
            pointColor: successColor,
            pointType: 'A',
            pointDescription: 'Sangat Baik',
            pointValue: '10',
          ),
          SizedBox(height: height * 0.01),
          PointDescriptionItem(
            pointColor: blueColor,
            pointType: 'B',
            pointDescription: 'Baik',
            pointValue: '6',
          ),
          SizedBox(height: height * 0.01),
          PointDescriptionItem(
            pointColor: warningColor,
            pointType: 'C',
            pointDescription: 'Cukup',
            pointValue: '4',
          ),
        ],
      ),
    );
  }
}