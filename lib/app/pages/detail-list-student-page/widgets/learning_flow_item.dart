import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fun_education_app_teacher/common/helper/themes.dart';

class LearningFlowItem extends StatelessWidget {
  const LearningFlowItem({
    Key? key,
    required this.title,
    required this.point1,
    required this.point2,
  }) : super(key: key);

  final String title;
  final String point1;
  final String point2;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double width = mediaQuery.width;
    final double height = mediaQuery.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
        vertical: height * 0.02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: blackColor,
      ),
      width: width,
      child: Row(
        children: [
          Container(
            width: width * 0.015,
            height: height * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: successColor,
            ),
          ),
          SizedBox(width: width * 0.04),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                '$title',
                group: AutoSizeGroup(),
                maxLines: 1,
                style: tsBodyMediumSemibold(whiteColor),
              ),
              SizedBox(height: height * 0.01),
              AutoSizeText(
                '\u2022 $point1',
                group: AutoSizeGroup(),
                maxLines: 1,
                style: tsBodySmallRegular(whiteColor),
              ),
              AutoSizeText(
                '\u2022 $point2',
                group: AutoSizeGroup(),
                maxLines: 2,
                style: tsBodySmallRegular(whiteColor),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15,
            color: whiteColor,
          ),
        ],
      ),
    );
  }
}
